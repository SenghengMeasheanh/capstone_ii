import 'package:flutter/material.dart';

class CareerQuizPage extends StatefulWidget {
  const CareerQuizPage({super.key});

  @override
  State<CareerQuizPage> createState() => _CareerQuizPageState();
}

class _CareerQuizPageState extends State<CareerQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Career Quiz'),
      ),
      body: Center(
        child: Text('Career Quiz Page'),
      ),
    );
  }
}
