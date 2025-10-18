
import 'custome_pop_ups_platform_interface.dart';

class CustomePopUps {
  Future<String?> getPlatformVersion() {
    return CustomePopUpsPlatform.instance.getPlatformVersion();
  }
  Future<num?> getBatteryLevel() {
    return CustomePopUpsPlatform.instance.getBatteryLevel();
  }
}
