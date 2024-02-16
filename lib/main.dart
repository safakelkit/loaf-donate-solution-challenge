import 'package:flutter/material.dart';
import 'screens/card_page/card_page.dart';

void main(){
  runApp(const Donation());
}

class Donation extends StatelessWidget {
  const Donation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Donation',
      home: CardPage()
    );
  }
}