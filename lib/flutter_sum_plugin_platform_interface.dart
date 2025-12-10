import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'flutter_sum_plugin_method_channel.dart';

abstract class FlutterSumPluginPlatform extends PlatformInterface {
  FlutterSumPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSumPluginPlatform _instance = MethodChannelFlutterSumPlugin();

  /// The default instance of [FlutterSumPluginPlatform] to use.
  static FlutterSumPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own instance.
  static set instance(FlutterSumPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Abstract method every platform must implement
  Future<int> sum(int a, int b);
}
