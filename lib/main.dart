import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MemoryLeaksScreen(),
    );
  }
}

class MemoryLeakObject {
  final String text;

  MemoryLeakObject(this.text);
}

List<MemoryLeakObject> leakObjects = [];

class MemoryLeaksScreen extends StatelessWidget {
  const MemoryLeaksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Add 1M Leaky Objects',
          ),
          onPressed: () {
            var i = 0;
            while (i < 1000000) {
              leakObjects.add(
                MemoryLeakObject('Id: ${leakObjects.length}'),
              );
              i++;
            }
          },
        ),
      ),
    );
  }
}
