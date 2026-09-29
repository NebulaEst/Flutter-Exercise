import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          leading: const Icon(Icons.home),
          title: const Text('Flutter Layout'),
        ),
        
        body: Container(
          margin: const EdgeInsets.all(
            10.0),
          child: Column(children: <Widget>[
            Row(children: const <Widget>[
              Icon(Icons.archive),
              Text('Artikel Terbaru',
                style: TextStyle(fontWeight: FontWeight.bold))
            ]),
            Card(
              child: Column(children: <Widget>[
                Image.network(
                  'https://picsum.photos/seed/borobudur/320/180',
                  width: 320,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 320,
                    height: 180,
                    color: Colors.green[100],
                    alignment: Alignment.center,
                    child: const Icon(Icons.image_not_supported, size: 48),
                  )),
                const Text('Candi Borobudur')
              ]),
            ),
          ]))));
  }
}