import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFE6E6E6),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Widget Bertingkat',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/Mambo.jpg',
                width: 180,
                height: 180,
              ),
              const SizedBox(height: 20),
              const Text(
                'Ini adalah aplikasi Flutter',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}