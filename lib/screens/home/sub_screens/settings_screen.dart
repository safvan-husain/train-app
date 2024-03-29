// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get/state_manager.dart";
import "package:toggle_switch/toggle_switch.dart";
import "package:train_app/common/widgets/custom_dialogue.dart";
import "package:train_app/global_state/user_state_controller.dart";
import "package:train_app/screens/home/bloc/home_bloc.dart";

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<SettingsTileModel> settingsTileModels = [
      SettingsTileModel(
        featureName: "Edit profile",
        isTapabble: true,
      ),
      SettingsTileModel(
        featureName: "Notifications",
        isTapabble: true,
      ),
      // SettingsTileModel(
      //   featureName: "Dark mode",
      //   isTapabble: false,
      // ),
      SettingsTileModel(
        featureName: "Payment Method",
        isTapabble: true,
      ),
      SettingsTileModel(
        featureName: "Security",
        isTapabble: true,
      ),
      SettingsTileModel(
        featureName: "Languages",
        isTapabble: true,
      ),
      SettingsTileModel(
        featureName: "Terms & Privacy policy",
        isTapabble: true,
      ),
      SettingsTileModel(
        featureName: "Help",
        isTapabble: true,
      ),
    ];
    return Positioned(
      top: 100,
      child: WillPopScope(
        onWillPop: () async {
          context.read<HomeBloc>().add(ShowMainScreen());
          return false;
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              GetBuilder<UserController>(builder: (s) {
                return SizedBox(
                  height: 60,
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueAccent,
                    ),
                    title: Obx(
                        () => Text(s.user.value?.name ?? "No Name assigned")),
                    subtitle: Text(
                      s.user.value?.email ??
                          s.user.value?.phone ??
                          "No Id provided",
                    ),
                  ),
                );
              }),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Colors.grey),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        settingsTileModels[index].featureName,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      if (settingsTileModels[index].isTapabble)
                        const Icon(Icons.arrow_right)
                      else
                        ToggleSwitch(
                          minWidth: 40,
                          borderWidth: 1,
                          fontSize: 12,
                          borderColor: [
                            Theme.of(context).primaryColorLight,
                          ],
                          icons: const [
                            Icons.dark_mode,
                            Icons.sunny,
                          ],
                          activeBorders: [
                            Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 2,
                            )
                          ],
                          cornerRadius: 20.0,
                          activeBgColors: [
                            [Theme.of(context).focusColor],
                            [Theme.of(context).focusColor],
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          inactiveFgColor: Theme.of(context).primaryColorLight,
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          // labels: const ['Railway', 'Metro'],
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        )
                    ],
                  ),
                ),
                itemCount: settingsTileModels.length,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const CustomDialuge(),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Colors.grey),
                  )),
                  child: Text(
                    "LogOut ?",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.red,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsTileModel {
  final String featureName;
  final bool isTapabble;
  final Function()? onTap;

  SettingsTileModel({
    required this.featureName,
    required this.isTapabble,
    this.onTap,
  });
}
