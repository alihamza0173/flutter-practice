import 'dart:developer';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

// import 'package:path_provider/path_provider.dart';

class FilerManager {
  static Future<String> localPath() async {
    final Directory whatsapp = Directory(
        '/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses');

    log('whatsapp: ${whatsapp.path}');
    if (!await whatsapp.exists()) {
      log('whatsapp not exists');
      return '';
    }
    log('whatsapp exists');

    final permissionStatus = await Permission.storage.status;
    if (permissionStatus.isDenied) {
      // Here just ask for the permission for the first time
      log('permissionStatus.isDenied');
      await Permission.storage.request();
      await Permission.manageExternalStorage.request();

      // I noticed that sometimes popup won't show after user press deny
      // so I do the check once again but now go straight to appSettings
      if (permissionStatus.isDenied) {
        log('permissionStatus.isDenied');
        await openAppSettings();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // Here open app settings for user to manually enable permission in case
      // where permission was permanently denied
      log('permissionStatus.isPermanentlyDenied');
      await openAppSettings();
    } else {
      // Do stuff that require permission here
      log('permissionStatus.isGranted');
      whatsapp.list().forEach((element) {
        log('element: ${element.path}');
      });
    }

    // final Directory tempDir = await getTemporaryDirectory();
    // log('tempDir: ${tempDir.path}');

    // final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    // log('appDocumentsDir: ${appDocumentsDir.path}');

    // final Directory? downloadsDir = await getDownloadsDirectory();
    // log('downloadsDir: ${downloadsDir?.path}');
    return whatsapp.path;
  }
}
