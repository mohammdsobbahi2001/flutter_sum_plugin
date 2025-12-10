# flutter_sum_plugin

A simple Flutter plugin that sums two integers using native code (Android & iOS).

## Features

- Sum two integers: `sum(a, b)`
- Works on Android and iOS

## Installation

Add to `pubspec.yaml`:

```yaml
dependencies:
  flutter_sum_plugin: ^0.1.0
```

For local testing (before publishing):

```yaml
dependencies:
  flutter_sum_plugin:
    path: ../
```

## Usage

```bash
import 'package:flutter_sum_plugin/flutter_sum_plugin.dart';

void main() async {
  int result = await FlutterSumPlugin.sum(3, 4);
  print('Sum result: $result'); // 7
}
```

## Example

See the example/ directory for a working example app.