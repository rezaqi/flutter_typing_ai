import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TypingText extends StatefulWidget {
  final Stream<String>? textStream;
  final String? text;
  final TextStyle? style;
  final Duration minDelay;
  final Duration maxDelay;
  final VoidCallback? onFinished;
  final bool useMarkdown;

  const TypingText({
    Key? key,
    this.textStream,
    this.text,
    this.style,
    this.minDelay = const Duration(milliseconds: 30),
    this.maxDelay = const Duration(milliseconds: 90),
    this.onFinished,
    this.useMarkdown = false,
  }) : super(key: key);

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  final Random _random = Random();
  String _visibleText = "";
  int _charIndex = 0;
  String _targetText = "";
  StreamSubscription<String>? _streamSub;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();

    if (widget.textStream != null) {
      _streamSub = widget.textStream!.listen((newText) {
        _resetAndStart(newText);
      });
    } else if (widget.text != null) {
      _resetAndStart(widget.text!);
    }
  }

  void _resetAndStart(String text) {
    setState(() {
      _targetText = text;
      _charIndex = 0;
      _visibleText = "";
    });
    if (!_isTyping) _startTyping();
  }

  Future<void> _startTyping() async {
    _isTyping = true;

    while (_charIndex < _targetText.length && mounted) {
      await Future.delayed(_randomDuration());

      setState(() {
        _visibleText += _targetText[_charIndex];
        _charIndex++;
      });
    }

    _isTyping = false;
    widget.onFinished?.call();
  }

  Duration _randomDuration() {
    final min = widget.minDelay.inMilliseconds;
    final max = widget.maxDelay.inMilliseconds;

    if (max <= min) {
      return Duration(milliseconds: min);
    }

    return Duration(milliseconds: min + _random.nextInt((max - min) + 1));
  }

  @override
  void dispose() {
    _streamSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.useMarkdown
        ? MarkdownBody(
            data: _visibleText,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              p: widget.style ?? const TextStyle(),
            ),
          )
        : Text(
            _visibleText,
            style: widget.style,
          );
  }
}
