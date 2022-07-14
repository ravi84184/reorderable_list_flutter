import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reorderable List"),
      ),
      body: ReorderableListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              key: ValueKey(list[index]),
              title: Text(list[index]),
            );
          },
          itemCount: list.length,
          onReorder: (oldIndex, newIndex) {
            // List re-arrange
            if (newIndex > oldIndex) newIndex--;

            final item = list.removeAt(oldIndex);
            list.insert(newIndex, item);
          }),
    );
  }
}
