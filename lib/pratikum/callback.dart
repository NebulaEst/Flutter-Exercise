import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Callback Example',
      home: CallbackExample(),
    );
  }
}

class CallbackExample extends StatelessWidget {
  const CallbackExample({super.key});

  // Membuat fungsi callback yang menerima String
  void _showMessage(String message) {
    debugPrint('message received: $message');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Callback Example',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.black,

              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),

              side: BorderSide.none,
            ),

            // Callback dijalankan ketika tombol ditekan
            onPressed: () {
              _showMessage('Button pressed');
            },

            child: const Text(
              'Press Me',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}