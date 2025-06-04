import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typing_ai/src/typing_text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typing AI Demo',
      theme: ThemeData.dark(),
      home: const TypingExamplePage(),
    );
  }
}

class TypingExamplePage extends StatefulWidget {
  const TypingExamplePage({super.key});

  @override
  State<TypingExamplePage> createState() => _TypingExamplePageState();
}

class _TypingExamplePageState extends State<TypingExamplePage> {
  late final StreamController<String> _controller;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<String>();
    _startTypingSimulation();
  }

  void _startTypingSimulation() async {
    await Future.delayed(const Duration(seconds: 1));
    _controller.add(
      "Hi! I'm flutter_typing_ai \n simulate typing in a smart way ",
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example flutter_typing_ai')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: TypingText(
            textStream: _controller.stream,
            style: const TextStyle(fontSize: 20),
            useMarkdown: true,
          ),
        ),
      ),
    );
  }
}
