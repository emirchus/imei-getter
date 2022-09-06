import 'package:flutter_test/flutter_test.dart';
import 'package:imei_getter/imei_getter.dart';
import 'package:imei_getter/imei_getter_platform_interface.dart';
import 'package:imei_getter/imei_getter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockImeiGetterPlatform 
    with MockPlatformInterfaceMixin
    implements ImeiGetterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ImeiGetterPlatform initialPlatform = ImeiGetterPlatform.instance;

  test('$MethodChannelImeiGetter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelImeiGetter>());
  });

  test('getPlatformVersion', () async {
    ImeiGetter imeiGetterPlugin = ImeiGetter();
    MockImeiGetterPlatform fakePlatform = MockImeiGetterPlatform();
    ImeiGetterPlatform.instance = fakePlatform;
  
    expect(await imeiGetterPlugin.getPlatformVersion(), '42');
  });
}
