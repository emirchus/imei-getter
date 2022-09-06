
import 'imei_getter_platform_interface.dart';

class ImeiGetter {
  Future<String?> getPlatformVersion() {
    return ImeiGetterPlatform.instance.getPlatformVersion();
  }
}
