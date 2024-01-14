// ignore_for_file: library_private_types_in_public_api

import 'package:clo/View/Auth/auth_checker.dart';
import 'package:clo/View_Model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(productViewModelController).getProductItems();
    });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthChecker()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffEE7735),
        child: const Center(
          child: Text(
            'Clo',
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
