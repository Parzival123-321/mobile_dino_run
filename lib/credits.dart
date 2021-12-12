import 'package:flutter/material.dart';

class CreditScreen extends StatefulWidget {
  @override
  CreditScreenState createState() => CreditScreenState();
}

class CreditScreenState extends State<CreditScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credits'),
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white54,
      ),
      backgroundColor: Colors.black45,
      body: const Center(
        child: Text('Made By: \n\nMohaned Al-jabori', style: TextStyle(
          fontSize: 18.0,
          color: Colors.white54
        ),
        ),
      ),
    );
  }
}