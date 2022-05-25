import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'device_info_helper.dart';

class SecureStorageHelper {
  static const secureStorageKey = 'secureStorageKey';

  static Future<String?> getStoredDeviceId() async {
    String? deviceId;
    var storage = const FlutterSecureStorage();

    // Get from storage
    deviceId = await storage.read(key: secureStorageKey);
    if (deviceId == null) {
      // Get from device
      deviceId = await DeviceInfoHelper.getDeviceId();

      // Store data
      if (deviceId != null) {
        // await storage.write(key: deviceInfoKey, value: deviceId);
        await storage.write(key: secureStorageKey, value: 'Jagaa$deviceId');
        debugPrint(deviceId);
      }
    }

    return deviceId;
  }
}
