import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'custome_pop_ups_platform_interface.dart';

/// An implementation of [CustomePopUpsPlatform] that uses method channels.
class MethodChannelCustomePopUps extends CustomePopUpsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('custome_pop_ups');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  @override
  Future<num?> getBatteryLevel() {
    return methodChannel.invokeMethod<num?>('getBatteryLevel');
  }
}
