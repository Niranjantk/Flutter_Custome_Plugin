import 'package:flutter_test/flutter_test.dart';
import 'package:custome_pop_ups/custome_pop_ups.dart';
import 'package:custome_pop_ups/custome_pop_ups_platform_interface.dart';
import 'package:custome_pop_ups/custome_pop_ups_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCustomePopUpsPlatform with MockPlatformInterfaceMixin implements CustomePopUpsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42'); 

  @override
  Future<num?> getBatteryLevel() => Future.value(21);
}

void main() {
  final CustomePopUpsPlatform initialPlatform = CustomePopUpsPlatform.instance;

  test('$MethodChannelCustomePopUps is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCustomePopUps>());
  });

  test('getPlatformVersion', () async {
    CustomePopUps customePopUpsPlugin = CustomePopUps();
    MockCustomePopUpsPlatform fakePlatform = MockCustomePopUpsPlatform();
    CustomePopUpsPlatform.instance = fakePlatform;

    expect(await customePopUpsPlugin.getPlatformVersion(), '42');
  });
  test('getBatteryLevel', () async {
    CustomePopUps mybatterypluginPlugin = CustomePopUps();
    MethodChannelCustomePopUps fakePlatform = MethodChannelCustomePopUps();
    CustomePopUpsPlatform.instance = fakePlatform;

    expect(await mybatterypluginPlugin.getBatteryLevel(), 21);
  });
}
