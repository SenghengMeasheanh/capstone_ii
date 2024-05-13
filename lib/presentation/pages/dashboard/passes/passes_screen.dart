import 'package:flutter/material.dart';

class PassesScreen extends StatefulWidget {
  const PassesScreen({super.key});

  @override
  State<PassesScreen> createState() => _PassesScreenState();
}

class _PassesScreenState extends State<PassesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Passes Screen'),
      ),
    );
  }
}