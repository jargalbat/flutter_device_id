import 'package:flutter/material.dart';
import 'device_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _deviceName;
  String? _deviceId;

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
            if (_deviceId != null) Text('Device id: $_deviceId'),
          ],
        ),
      ),
    );
  }

  void _getDeviceInfo() async {
    _deviceName = await DeviceHelper.getDeviceName();
    _deviceId = await DeviceHelper.getStoredDeviceId();
    setState(() {});
  }
}
