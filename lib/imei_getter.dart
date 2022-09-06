
import 'imei_getter_platform_interface.dart';

class ImeiGetter {
  Future<String?> getLanguage() {
    return ImeiGetterPlatform.instance.getLanguage();
  }

  Future<String?> getImei() {
    return ImeiGetterPlatform.instance.getImei();
  }
}
