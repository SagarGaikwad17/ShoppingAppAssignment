import 'package:clo/Utils/Dialouge/error_dialouge.dart';
import 'package:clo/View/Auth/auth_checker.dart';
import 'package:clo/View/Auth/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  bool isLoading = false;

  Future<void> verifyPhoneAuth(String countryCode, String mobile) async {
    isLoading = true;
    var mobileToSend = mobile;
    smsOTPSent(String verId, [int? forceCodeResend]) {
      verificationId = verId;
    }

    print(mobileToSend);

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: mobileToSend,
          codeAutoRetrievalTimeout: (String verId) {
            verificationId = verId;
          },
          codeSent: smsOTPSent,
          timeout: const Duration(
            seconds: 120,
          ),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            isLoading = false;

            print(phoneAuthCredential);
          },
          verificationFailed: (FirebaseAuthException exceptio) {
            print('------>>> error $exceptio');
            throw exceptio;
          });
      isLoading = false;
    } catch (e) {
      isLoading = false;

      rethrow;
    }
    notifyListeners();
  }

  verifyPhone(
      BuildContext context, String selectedCountryCode, String mobileNumber) {
    print('${selectedCountryCode + mobileNumber}');
    try {
      verifyPhoneAuth(selectedCountryCode, selectedCountryCode + mobileNumber)
          .then((value) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => OtpScreen()));
      }).catchError((e) {
        String errorMsg = 'Cant Authenticate you, Try Again Later';
        if (e.toString().contains(
            'We have blocked all requests from this device due to unusual activity. Try again later.')) {
          errorMsg = 'Please wait as you have used limited number request';
        }
        ErrorDialogUtils.showErrorCustomDialog(context, errorMsg);
      });
    } catch (e) {
      ErrorDialogUtils.showErrorCustomDialog(context, e.toString());
    }
  }

  Future<void> verifyOTPAuth(String otp) async {
    isLoading = true;

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );
      final UserCredential user = await _auth.signInWithCredential(credential);
      final User? currentUser = _auth.currentUser;
      print(user);

      if (currentUser!.uid != "") {
        print(currentUser.uid);
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;

      rethrow;
    }
    isLoading = false;

    notifyListeners();
  }

  verifyOTP(BuildContext context, String mobileNumber) {
    try {
      verifyOTPAuth(mobileNumber).then((_) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AuthChecker()));
      }).catchError((e) {
        String errorMsg = 'Cant authentiate you Right now, Try again later!';
        if (e.toString().contains("ERROR_SESSION_EXPIRED")) {
          errorMsg = "Session expired, please resend OTP!";
        } else if (e.toString().contains("ERROR_INVALID_VERIFICATION_CODE")) {
          errorMsg = "You have entered wrong OTP!";
        }
        ErrorDialogUtils.showErrorCustomDialog(context, errorMsg);
      });
    } catch (e) {
      ErrorDialogUtils.showErrorCustomDialog(context, e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

final authenticationProvider =
    ChangeNotifierProvider<AuthenticationViewModel>((ref) {
  return AuthenticationViewModel();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChange;
});
