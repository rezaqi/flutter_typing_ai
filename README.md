# 🧠 flutter_typing_ai

A smart Flutter widget that simulates **human-like typing** with realistic delays, typos, markdown rendering, and sound effects — perfect for chatbots, storytelling, or AI assistants.

![version](https://img.shields.io/pub/v/flutter_typing_ai?style=flat-square)
![likes](https://img.shields.io/pub/likes/flutter_typing_ai?style=flat-square)
![score](https://img.shields.io/pub/points/flutter_typing_ai?style=flat-square)

---

## ✨ Features

- ⏱️ **Realistic typing speed** with random delays between characters.
- 😅 **Human-like typos** (with smart correction behavior).
- 🔊 Optional **keyboard click sound** per character.
- 🔁 Supports **stream-based typing** (`Stream<String>`).
- 🧾 **Markdown** support (bold, italics, code, etc.).

---

## 🚀 Getting Started

### 1. Add the dependency

```yaml
dependencies:
  flutter_typing_ai: ^1.0.0
```
### 2. Import it

```dart
import 'package:flutter_typing_ai/flutter_typing_ai.dart';
```
### 3. Example

```dart
// Static text typing
TypingText(
  text: "Hello, I type like a real human... 🤖",
  style: TextStyle(fontSize: 20),
  simulateTypos: true,
  enableSound: true,
  useMarkdown: false,
)
// Stream-based typing
TypingText(
  textStream: yourStreamOfText,
  useMarkdown: true,
)```
```
## 📚 Parameters

| Parameter       | Type              | Default                        | Description                                                                                   |
|-----------------|-------------------|--------------------------------|-----------------------------------------------------------------------------------------------|
| `text`          | `String?`         | `null`                         | The static text to be typed out character by character.                                       |
| `textStream`    | `Stream<String>?` | `null`                         | A stream of text chunks to type dynamically, useful for live updates.                         |
| `style`         | `TextStyle`       | -                              | Text style to apply to the typed text.                                                        |
| `simulateTypos` | `bool`            | `false`                       | Enables simulation of human-like typos and corrections.                                       |
| `enableSound`   | `bool`            | `false`                       | Enables keyboard click sound effect during typing.                                            |
| `useMarkdown`   | `bool`            | `false`                       | Enables Markdown rendering for rich text formatting (bold, italic, code, etc.).               |
| `minDelay`      | `Duration`        | `Duration(milliseconds: 30)`  | Minimum delay between typing each character, to simulate typing speed variance.               |
| `maxDelay`      | `Duration`        | `Duration(milliseconds: 150)` | Maximum delay between typing each character, to simulate typing speed variance.               |

## 🛠️ Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to check the [issues page](https://github.com/your-username/flutter_typing_ai/issues).

## 📄 License

MIT © [Your Name or Organization]

## 📦 Example App

Check out the full example in the [`example`](example/lib/main.dart) folder for a complete demo.

## 💡 Use Cases

- 🤖 Chatbots & AI Assistants
- 📚 Storytelling / interactive fiction
- 🧪 Typing effects in tutorials or onboarding
- 🎮 Narrative games
