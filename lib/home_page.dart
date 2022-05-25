import 'package:flutter/material.dart';
import 'package:flutter_device_id/device_info_helper.dart';
import 'package:flutter_device_id/key_chain_helper.dart';
import 'secure_storage_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _deviceName;
  String? _secureStorageDeviceId;
  String? _keyChainDeviceId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getDeviceInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device id demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_deviceName != null) Text('Device name: $_deviceName'),
            if (_secureStorageDeviceId != null) Text('Secure storage device id: $_secureStorageDeviceId'),
            if (_keyChainDeviceId != null) Text('Key chain device id: $_keyChainDeviceId'),
          ],
        ),
      ),
    );
  }

  void _getDeviceInfo() async {
    _deviceName = await DeviceInfoHelper.getDeviceName();
    _secureStorageDeviceId = await SecureStorageHelper.getStoredDeviceId();
    // _keyChainDeviceId = await KeyChainHelper.getStoredDeviceId();
    setState(() {});
  }
}
