import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'imei_getter_platform_interface.dart';

/// An implementation of [ImeiGetterPlatform] that uses method channels.
class MethodChannelImeiGetter extends ImeiGetterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('imei_getter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
