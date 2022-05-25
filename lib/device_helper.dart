import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeviceHelper {
  static const kDeviceId = 'kDeviceId';

  static Future<String?> getStoredDeviceId() async {
    String? deviceId;
    var storage = const FlutterSecureStorage();

    // Get from storage
    deviceId = await storage.read(key: kDeviceId);
    if (deviceId == null) {
      // Get from device
      deviceId = await getDeviceId();

      // Store data
      if (deviceId != null) {
        // await storage.write(key: kDeviceId, value: deviceId);
        await storage.write(key: kDeviceId, value: 'Jagaa$deviceId');
        debugPrint(deviceId);
      }
    }

    return deviceId;
  }

  static Future<String?> getDeviceId() async {
    String? deviceId;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.androidId;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    }

    return deviceId;
  }

  static Future<String?> getDeviceName() async {
    String? deviceName;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      deviceName = webBrowserInfo.userAgent;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = iosInfo.utsname.machine;
    }

    return deviceName;
  }
}
