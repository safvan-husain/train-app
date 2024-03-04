
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
// import 'package:toggle_switch/toggle_switch.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';
import 'package:train_app/screens/home/sub_screens/book_ticket_screen.dart';
import 'package:train_app/screens/home/sub_screens/find_train_screen.dart';
import 'package:train_app/screens/home/sub_screens/my_ticket_screen.dart';
import 'package:train_app/screens/home/sub_screens/settings_screen.dart';
import 'package:train_app/screens/home/sub_screens/widgets/live_status_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Stack(
              children: [
                Scaffold(
                  backgroundColor: state.isOnSearch
                      ? Theme.of(context).canvasColor
                      : Colors.transparent,
                  appBar: AppBar(
                    title: Text(
                      "Hi Good Morning👋",
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    actions: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: ToggleSwitch(
                          minWidth: 70,
                          borderWidth: 1,
                          fontSize: 12,
                          borderColor: [
                            Theme.of(context).primaryColorLight,
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
                          labels: const ['Railway', 'Metro'],
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<HomeBloc>().add(ShowSettings());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                    backgroundColor: Theme.of(context).primaryColorLight,
                    bottom: state.instance == HomeStateInstanceType.settings
                        ? null
                        : TabBar(
                            isScrollable: true,
                            tabs: [
                              Text(
                                "Book Ticket",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              Text(
                                "My Ticket",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              Text(
                                "Find Train",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ]
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: e,
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                ),
                if (state.instance == HomeStateInstanceType.settings)
                  const SettingsScreen()
                else
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 708),
                    curve: Curves.easeInOut,
                    top: state.isOnSearch ? 50 : 130,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width,
                      child: const TabBarView(
                        children: [
                          BookTicketScreen(),
                          MyTicketScreen(),
                          FindTrainScreen(),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
