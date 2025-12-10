import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [FlutterSumPluginPlatform] that uses method channels.
class MethodChannelFlutterSumPlugin extends FlutterSumPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_sum_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
