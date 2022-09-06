import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'imei_getter_method_channel.dart';

abstract class ImeiGetterPlatform extends PlatformInterface {
  /// Constructs a ImeiGetterPlatform.
  ImeiGetterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ImeiGetterPlatform _instance = MethodChannelImeiGetter();

  /// The default instance of [ImeiGetterPlatform] to use.
  ///
  /// Defaults to [MethodChannelImeiGetter].
  static ImeiGetterPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ImeiGetterPlatform] when
  /// they register themselves.
  static set instance(ImeiGetterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
