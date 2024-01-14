import 'package:clo/Utils/Common_Widget/custome_textfield.dart';
import 'package:clo/View_Model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreen extends ConsumerWidget {
  final controller = TextEditingController();

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Center(
                  child: Text(
                    'Clo',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        color: Color(0XFFF07835)),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                 const Center(
                  child: Text(
                    'Verify!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'We are sending an otp to validate your mobile number, Hang on!.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomeTextField(
                  titleLabel: 'Enter 6 digit Code',
                  maxLength: 6,
                  icon: Icons.dialpad,
                  controller: controller,
                  inputType: TextInputType.phone,
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0XFFF07835),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: InkWell(
                          onTap: !ref.watch(authenticationProvider).isLoading
                              ? () {
                                  if (controller.text.length == 6) {
                                  ref
                          .watch(authenticationProvider)
                          .verifyOTP(context, controller.text.toString());
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text('Error Occured'),
                                        content:
                                            Text('Enter valid otp '),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Text('OK!'),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }
                              : null,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Center(
                              child:
                                  !ref.watch(authenticationProvider).isLoading
                                      ? const Text(
                                          'Verify Code',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        )
                                      : const CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
