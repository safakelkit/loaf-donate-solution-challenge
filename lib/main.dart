import 'package:flutter/material.dart';
import 'package:sc/screens/login_register_pages/login.dart';

void main(){
  runApp(const Donation());
}

class Donation extends StatelessWidget {
  const Donation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login()
    );
  }
}