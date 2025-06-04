import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TypingText extends StatefulWidget {
  final Stream<String>? textStream;
  final String? text;
  final TextStyle? style;
  final Duration minDelay;
  final Duration maxDelay;
  final VoidCallback? onFinished;
  final bool simulateTypos;
  final bool enableSound;
  final bool useMarkdown;

  const TypingText({
    this.textStream,
    this.text,
    this.style,
    this.minDelay = const Duration(milliseconds: 30),
    this.maxDelay = const Duration(milliseconds: 90),
    this.onFinished,
    this.simulateTypos = true,
    this.enableSound = false,
    this.useMarkdown = false,
    super.key,
  });

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  final Random _random = Random();
  String _visibleText = "";

  int _charIndex = 0;
  String _targetText = "";
  StreamSubscription<String>? _streamSub;

  @override
  void initState() {
    super.initState();

    if (widget.textStream != null) {
      _streamSub = widget.textStream!.listen((newText) {
        setState(() {
          _targetText = newText;
          _charIndex = 0;
          _visibleText = "";
        });
        _startTyping();
      });
    } else if (widget.text != null) {
      _targetText = widget.text!;
      _startTyping();
    }
  }

  Future<void> _startTyping() async {
    while (_charIndex < _targetText.length) {
      await Future.delayed(_randomDuration());

      if (!mounted) return;

      setState(() {
        String nextChar = _targetText[_charIndex];

        if (widget.simulateTypos && _random.nextDouble() < 0.05) {
          // Simulate a typo: insert wrong char
          String typoChar = String.fromCharCode(_random.nextInt(26) + 97);
          _visibleText += typoChar;
          _playSound();
        } else {
          _visibleText += nextChar;
          _charIndex++;
          _playSound();
        }
      });

      if (widget.simulateTypos &&
          _visibleText.length > 1 &&
          _random.nextDouble() < 0.05) {
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          _visibleText = _visibleText.substring(0, _visibleText.length - 1);
        });
        await Future.delayed(_randomDuration());
      }
    }

    widget.onFinished?.call();
  }

  Duration _randomDuration() {
    return Duration(
      milliseconds:
          widget.minDelay.inMilliseconds +
          _random.nextInt(widget.maxDelay.inMilliseconds + 1),
    );
  }

  void _playSound() {
    if (!widget.enableSound) return;
    SystemSound.play(SystemSoundType.alert);
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
          styleSheet: MarkdownStyleSheet(p: widget.style ?? const TextStyle()),
        )
        : Text(_visibleText, style: widget.style);
  }
}
