import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_sum_plugin/flutter_sum_plugin.dart';
import 'package:flutter_sum_plugin/flutter_sum_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterSumPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterSumPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterSumPluginPlatform initialPlatform = FlutterSumPluginPlatform.instance;

  test('$MethodChannelFlutterSumPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterSumPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterSumPlugin flutterSumPlugin = FlutterSumPlugin();
    MockFlutterSumPluginPlatform fakePlatform = MockFlutterSumPluginPlatform();
    FlutterSumPluginPlatform.instance = fakePlatform;

    expect(await flutterSumPlugin.getPlatformVersion(), '42');
  });
}
