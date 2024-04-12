# hexcolor_renderer

A Flutter package to easily generate Color objects from hexcolor string values with customizable opacity and lightening effects.

## Installation

Add `hexcolor_renderer` to your `pubspec.yaml` file:

```yaml
dependencies:
  hexcolor_renderer: <specify the version here>
```

## Usage

Import the package in your Dart code:

```dart
import 'package:hexcolor_renderer/hexcolor_renderer.dart';
```

### Generating Color from Hexadecimal String

You can create a Color object from a hexadecimal color string using the `HexColorValue` class:

```dart
Color color = HexColorValue("#FF5722");
```

### Adding Opacity

You can specify opacity for the color using the `OpacityValue` enum:

```dart
Color translucentColor = HexColorValue.transparent("#FF5722", OpacityValue.lowOpacity);
```

### Lightening Color

You can lighten a color by specifying a lightening factor between 0.0 and 1.0:

```dart
Color lightenedColor = HexColorValue.lighten("#FF5722", 0.2);
```

## Opacity Values

The `OpacityValue` enum provides pre-defined opacity levels:

- `fullOpacity`
- `highOpacity`
- `midOpacity`
- `lowOpacity`
- `zeroOpacity`

## Example

```dart
import 'package:flutter/material.dart';
import 'package:hexcolor_renderer/hexcolor_renderer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HexColor Demo'),
        ),
        body: Center(
          child: Container(
            color: HexColorValue.transparent("#FF5722", OpacityValue.lowOpacity),
            child: Text(
              'Hello, World!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
```