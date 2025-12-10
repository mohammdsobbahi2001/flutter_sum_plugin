import 'dart:async';
import 'package:flutter/services.dart';

class FlutterSumPlugin {
  static const MethodChannel _channel = MethodChannel('flutter_sum_plugin');

  /// Sums two integers and returns the result.
  /// Throws a PlatformException if native side returns an error.
  static Future<int> sum(int a, int b) async {
    final result = await _channel.invokeMethod<int>('sum', {'a': a, 'b': b});
    // result may be null if native returns null, guard it
    if (result == null) {
      throw PlatformException(code: 'NULL_RESULT', message: 'sum returned null');
    }
    return result;
  }
}
