import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custome_pop_ups/custome_pop_ups_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCustomePopUps platform = MethodChannelCustomePopUps();
  const MethodChannel channel = MethodChannel('custome_pop_ups');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        if (methodCall.method == 'getPlatformVersion') {
          return '42';
        } else if (methodCall.method == 'getBatteryLevel') {
          return 21;
        }
        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('getBatteryLevel', () async {
    expect(await platform.getBatteryLevel(), 21);
  });
}
