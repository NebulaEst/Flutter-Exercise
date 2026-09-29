import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Example',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ), // ThemeData
      home: const UserInputExample(),
    ); // MaterialApp
  }
}

class UserInputExample extends StatefulWidget {
  const UserInputExample({super.key});

  @override
  State<UserInputExample> createState() => _UserInputExampleState();
}

class _UserInputExampleState extends State<UserInputExample> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
  String _currentUsername = "[Nama Pengguna akan muncul di sini]";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    setState(() {
      if (_usernameController.text.trim().isNotEmpty) {
        _currentUsername = _usernameController.text;
      } else {
        _currentUsername = "[Nama Pengguna akan muncul di sini]";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ), // AppBar
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Card Form Login
              Container(
                width: 350,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4F8),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400, width: 1.5),
                ), // BoxDecoration
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Login Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ), // Text
                    const SizedBox(height: 20),
                    // TextField Username
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Masukkan nama pengguna',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ), // EdgeInsets.symmetric
                      ), // InputDecoration
                    ), // TextField
                    const SizedBox(height: 16),
                    // TextField Password
                    TextField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ), // EdgeInsets.symmetric
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey.shade700,
                          ), // Icon
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ), // IconButton
                      ), // InputDecoration
                    ), // TextField
                    const SizedBox(height: 20),
                    // Tombol Login
                    ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C4378),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ), // RoundedRectangleBorder
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ), // Text
                    ), // ElevatedButton
                  ],
                ), // Column
              ), // Container

              const SizedBox(height: 20),

              // Card Hasil
              Container(
                width: 350,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400, width: 1.5),
                ), // BoxDecoration
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Current Username:',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ), // Text
                    const SizedBox(height: 4),
                    Text(
                      _currentUsername,
                      style: const TextStyle(fontSize: 16, color: Colors.black87),
                    ), // Text
                  ],
                ), // Column
              ), // Container
            ],
          ), // Column
        ), // SingleChildScrollView
      ), // Center
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ), // FloatingActionButton
    ); // Scaffold
  }
}