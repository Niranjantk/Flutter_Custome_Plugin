import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'custome_pop_ups_method_channel.dart';

abstract class CustomePopUpsPlatform extends PlatformInterface {
  /// Constructs a CustomePopUpsPlatform.
  CustomePopUpsPlatform() : super(token: _token);

  static final Object _token = Object();

  static CustomePopUpsPlatform _instance = MethodChannelCustomePopUps();

  /// The default instance of [CustomePopUpsPlatform] to use.
  ///
  /// Defaults to [MethodChannelCustomePopUps].
  static CustomePopUpsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CustomePopUpsPlatform] when
  /// they register themselves.
  static set instance(CustomePopUpsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<num?> getBatteryLevel() {
    throw UnimplementedError('getBatteryLevel() has not been implemented.');
  }
}
