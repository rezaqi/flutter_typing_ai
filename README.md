# 🧠 flutter_typing_ai

A sophisticated Flutter widget that mimics natural human typing with adjustable delays, optional typos simulation, Markdown support, and sound effects — ideal for chatbots, interactive stories, and AI assistants.

![version](https://img.shields.io/pub/v/flutter_typing_ai?style=flat-square)
![likes](https://img.shields.io/pub/likes/flutter_typing_ai?style=flat-square)
![score](https://img.shields.io/pub/points/flutter_typing_ai?style=flat-square)

---

## ✨ Features

- ⏱️ **Realistic typing speed** with random delays between characters.
- 🔁 Supports **stream-based typing** (`Stream<String>`).
- 🧾 **Markdown** support (bold, italics, code, etc.).

---

## 🚀 Getting Started

### 1. Add the dependency

```yaml
dependencies:
  flutter_typing_ai: ^1.0.2
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
  useMarkdown: false,
)
// Stream-based typing
TypingText(
  textStream: yourStreamOfText,
  useMarkdown: true,
)
```
## 📚 Parameters

| Parameter       | Type              | Default                        | Description                                                                                   |
|-----------------|-------------------|--------------------------------|-----------------------------------------------------------------------------------------------|
| `text`          | `String?`         | `null`                         | The static text to be typed out character by character.                                       |
| `textStream`    | `Stream<String>?` | `null`                         | A stream of text chunks to type dynamically, useful for live updates.                         |
| `style`         | `TextStyle`       | -                              | Text style to apply to the typed text.                                            |
| `useMarkdown`   | `bool`            | `false`                       | Enables Markdown rendering for rich text formatting (bold, italic, code, etc.).               |
| `minDelay`      | `Duration`        | `Duration(milliseconds: 30)`  | Minimum delay between typing each character, to simulate typing speed variance.               |
| `maxDelay`      | `Duration`        | `Duration(milliseconds: 150)` | Maximum delay between typing each character, to simulate typing speed variance.               |

## 📄 License

MIT License © 2025 Rezaqi Adib


## 📦 Example App

Check out the full example in the [`example`](example/lib/main.dart) folder for a complete demo.

## 💡 Use Cases

- 🤖 Chatbots & AI Assistants
- 📚 Storytelling / interactive fiction
- 🧪 Typing effects in tutorials or onboarding
- 🎮 Narrative games

## 🛠️ Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to check the [issues page](https://github.com/rezaqi/flutter_typing_ai/issues).
