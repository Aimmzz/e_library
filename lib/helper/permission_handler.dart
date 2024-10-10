import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (status.isDenied) {
        status = await Permission.storage.request();
      }
      return status.isGranted;
    }
    return true;
  }

  Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      status = await Permission.camera.request();
    }
    return status.isGranted;
  }

  Future<bool> handlePermissions() async {
    bool storageGranted = await requestStoragePermission();
    bool cameraGranted = await requestCameraPermission();

    if (!storageGranted || !cameraGranted) {
      return false;
    }
    return true;
  }
}
