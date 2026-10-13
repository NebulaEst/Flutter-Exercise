import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: Scaffold(
        appBar: AppBar(title: Text('row and column')),
        //AppBar
        body: Column(
          children: [
            Text('row and column'),
            Row(
              children: [
                Text('row 1'),
                Text('row 2'),
                Text('row 3'),
              ], //<Widget>[]
            ), //column
          ], // scffold
        ),
      ),
    );
  }
}
