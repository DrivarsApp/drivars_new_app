import 'dart:io';

import 'package:device_info/device_info.dart';

class RepositoryService {
//  final storage = new FlutterSecureStorage();

  Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.androidId;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    }

    //await storage.write(key: 'device_id', value: deviceId);

    return deviceId;
  }
}
