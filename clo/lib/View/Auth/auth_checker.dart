import 'package:clo/Utils/Common_Widget/error_screen.dart';
import 'package:clo/Utils/Common_Widget/loading_screen.dart';
import 'package:clo/View/Auth/login_screen.dart';
import 'package:clo/View/Dashboard/dashboard_screen.dart';
import 'package:clo/View_Model/auth_view_model.dart';
import 'package:clo/View_Model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthChecker extends ConsumerWidget {
  AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
   

    return authState.when(
        data: (data) {
          if (data != null) return DashboardScreen();
          return LoginScreen();
        },
        loading: () => const LoadingScreen(),
        error: (e, trace) => ErrorScreen(e, trace));
  }
}
