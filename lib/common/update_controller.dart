import 'dart:io';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:flutter/material.dart';
import 'package:flutter_upgrade_version/flutter_upgrade_version.dart';

/*
I did setup shorebird to only update if there are no update availible on playstore.
because if we always update the app using shorebird, on some scenario it will cause the app to crash,
the reason is that, shorebird cannot upate the native code, it can only update dart code.
conside a situation where we added a plugin, it means we both change dart code and native code, if we update this with shorebird, it will update the dart code,
but the dart code calls the native which will not be existing in that app,
so what I planed is, we will update in the playstore whenver we change the native code, otherwise we will use shorebird to update.
*/

class AppUpdateController {
  static Future<void> init() async {
    final shorebirdCodePush = ShorebirdCodePush();

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
      } else {
        //if update from play store not availible, check shorebird update.
        //the reson for not updating shorebord code push when play store update is availible is that, shorebid do  not support code changes in the native side
        //so, consider we have changed a plugin, which mean we change both dart and native code, and shorebird will update the dart code, but that might cause a error in the app due not updating native code
        //so I planned to update the app on playstore whenever there is a native code change.
        try {
          final isUpdateAvailable =
              await shorebirdCodePush.isNewPatchAvailableForDownload();

          if (isUpdateAvailable) {
            // Download the new patch if it's available.
            await shorebirdCodePush.downloadUpdateIfAvailable();
          }
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
