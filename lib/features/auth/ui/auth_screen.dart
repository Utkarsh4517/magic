// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:magic/features/home/ui/home_screen.dart';
import 'package:magic_sdk/magic_sdk.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Magic link authenticaiton'),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            TextButton(
              onPressed: () async {
                var token = await Magic.instance.auth
                    .loginWithEmailOTP(email: emailController.text);
                if (token.isEmpty) {
                  //
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }
              },
              child: const Text('Login with Email'),
            ),
            TextField(
              controller: mobileController,
              keyboardType: TextInputType.number,
            ),
            TextButton(
              onPressed: () async {
                var token = await Magic.instance.auth
                    .loginWithSMS(phoneNumber: mobileController.text);
                if (token.isEmpty) {
                  //
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }
              },
              child: const Text('Login with Mobile'),
            ),
          ],
        ),
      )),
    );
  }
}
