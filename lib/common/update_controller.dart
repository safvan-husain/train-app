import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_upgrade_version/flutter_upgrade_version.dart';

class AppUpdateController {
  static Future<void> init() async {
    /// Android
    if (Platform.isAndroid) {
      PackageInfo _packageInfo = await PackageManager.getPackageInfo();
      InAppUpdateManager manager = InAppUpdateManager();

      AppUpdateInfo? appUpdateInfo = await manager.checkForUpdate();
      if (appUpdateInfo == null) {
        print('app info is null');
        return;
      } //Exception
      if (appUpdateInfo.updateAvailability ==
          UpdateAvailability.developerTriggeredUpdateInProgress) {
        ///If an in-app update is already running, resume the update.
        String? message =
            await manager.startAnUpdate(type: AppUpdateType.immediate);

        ///message return null when run update success
      } else if (appUpdateInfo.updateAvailability ==
          UpdateAvailability.updateAvailable) {
        ///Update available
        if (appUpdateInfo.immediateAllowed) {
          debugPrint('Start an immediate update');
          String? message =
              await manager.startAnUpdate(type: AppUpdateType.immediate);

          ///message return null when run update success
        } else if (appUpdateInfo.flexibleAllowed) {
          debugPrint('Start an flexible update');
          String? message =
              await manager.startAnUpdate(type: AppUpdateType.flexible);

          ///message return null when run update success
        } else {
          debugPrint(
              'Update available. Immediate & Flexible Update Flow not allow');
        }
      } else {}
    }
  }
}
