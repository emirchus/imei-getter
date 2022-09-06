import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imei_getter/imei_getter_method_channel.dart';

void main() {
  MethodChannelImeiGetter platform = MethodChannelImeiGetter();
  const MethodChannel channel = MethodChannel('imei_getter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
