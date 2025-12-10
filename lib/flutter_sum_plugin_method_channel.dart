import 'package:flutter/services.dart';
import 'flutter_sum_plugin_platform_interface.dart';

class MethodChannelFlutterSumPlugin extends FlutterSumPluginPlatform {
  final MethodChannel _channel = const MethodChannel('flutter_sum_plugin');

  @override
  Future<int> sum(int a, int b) async {
    final result = await _channel.invokeMethod<int>('sum', {'a': a, 'b': b});
    if (result == null) throw Exception('sum returned null');
    return result;
  }
}
