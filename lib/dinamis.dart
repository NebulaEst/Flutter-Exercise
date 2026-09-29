import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dynamic List Example',
      home: DynamicListExample(),
    );
  }
}

class DynamicListExample extends StatefulWidget {
  const DynamicListExample({super.key});

  @override
  State<DynamicListExample> createState() => _DynamicListExampleState();
}

class _DynamicListExampleState extends State<DynamicListExample> {
  final List<String> items = ['Apple', 'Banana', 'Orange',];
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _addItem() {
    final item = textEditingController.text.trim();
    if (item.isEmpty) {
      return;
    }

    setState(() {
      items.add(item);
      textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic List Example'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Add New Item',
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addItem,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}