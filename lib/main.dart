import 'package:flutter/material.dart';
import 'package:magic/constants/magic_api.dart';
import 'package:magic/features/auth/ui/auth_screen.dart';
import 'package:magic_sdk/magic_sdk.dart';

void main() {
  runApp(const MyApp());
  Magic.instance = Magic(magicApi);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Stack(children: [ // Use Stack() here
          const MaterialApp(
            home: AuthScreen(),
          ),
          Magic.instance.relayer // Insert Magic relayer here
        ])
    );
  }
}
