import 'package:flutter/material.dart';
import 'package:ucp1/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(
        namaUser: 'admin',
        email: 'admin@gmail.com',
        password: 'admin123',
      ),
    );
  }
}

