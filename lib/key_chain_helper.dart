// import 'package:flutter/foundation.dart';
// import 'package:flutter_keychain/flutter_keychain.dart';
// import 'device_info_helper.dart';
//
// class KeyChainHelper {
//   static const keyChainKey = 'keyChainKey';
//
//   static Future<String?> getStoredDeviceId() async {
//     String? deviceId;
//     // Get from storage
//     deviceId = await FlutterKeychain.get(key: "key");
//     if (deviceId == null) {
//       // Get from device
//       deviceId = await DeviceInfoHelper.getDeviceId();
//
//       // Store data
//       if (deviceId != null) {
//         // await FlutterKeychain.put(key: keyChainKey, value: deviceId);
//         await FlutterKeychain.put(key: keyChainKey, value: 'Jagaa$deviceId');
//         debugPrint(deviceId);
//       }
//     }
//
//     return deviceId;
//   }
// }
