// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as b;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:train_app/common/helper_methods.dart';
import 'package:train_app/helpers/station_code_helper.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';
import 'package:train_app/screens/home/sub_screens/pnr_status_screen.dart';
import 'package:train_app/screens/home/sub_screens/running_status_screen.dart';

class FindTrainsFieald extends StatefulWidget {
  const FindTrainsFieald({
    Key? key,
  }) : super(key: key);

  @override
  State<FindTrainsFieald> createState() => _FindTrainsFiealdState();
}

class _FindTrainsFiealdState extends State<FindTrainsFieald>
    with TickerProviderStateMixin {
  late TabController controller;

  String from = '';
  String to = '';
  bool isDepatureField = true;
  late final TextEditingController depature;
  late final TextEditingController arrival;
  @override
  void initState() {
    depature =
        TextEditingController(text: context.read<HomeBloc>().state.depature);
    arrival =
        TextEditingController(text: context.read<HomeBloc>().state.arrival);
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool _isOnFrom = true;

  @override
  Widget build(BuildContext context) {
    return b.BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
                // boxShadow: state.isOnSearch
                //     ? null
                //     : [
                //         BoxShadow(
                //           color: Theme.of(context)
                //               .scaffoldBackgroundColor, // Color of the shadow
                //           spreadRadius: 2, // Spread radius
                //           blurRadius: 4, // Blur radius
                //           offset: const Offset(0, 3), // Shadow offset
                //         ),
                //       ],
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TabBar(
                    controller: controller,
                    dividerColor: Colors.blue,
                    // indicatorWeight: 10,
                    indicatorColor: Theme.of(context).focusColor,
                    // indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "IRTC",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: controller.index == 0
                                        ? Theme.of(context).focusColor
                                        : Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Text(
                        "METRO",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: controller.index == 1
                                      ? Theme.of(context).focusColor
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: TabBarView(
                      controller: controller,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: state.isOnSearch ? 10 : 0),
                          child: Column(
                            mainAxisAlignment: state.isOnSearch
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 160,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      width: 40,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            color: Colors.green,
                                            size: 15,
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: const VerticalDivider(
                                                indent: 20,
                                                endIndent: 20,
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.train,
                                            color: Colors.green,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: TextField(
                                              controller: depature,
                                              onTap: () {
                                                _isOnFrom = true;
                                                isDepatureField = true;
                                                if (!state.isOnSearch) {
                                                  context
                                                      .read<HomeBloc>()
                                                      .add(EnterStationCode());
                                                }
                                              },
                                              onSubmitted: (value) {},
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                suffix: Text(
                                                  state.stationCodeHelper
                                                              .stations[
                                                          state.depature] ??
                                                      "",
                                                  maxLines: 1,
                                                  style: GoogleFonts.outfit(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .focusColor,
                                                  ),
                                                ),
                                                hintText: "From",
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color: Colors.grey),
                                              ),
                                              onChanged: (value) {
                                                context.read<HomeBloc>().add(
                                                      FilterStations(
                                                          searchTerm: value),
                                                    );
                                              },
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                String temp = arrival.text;
                                                arrival.text = depature.text;
                                                depature.text = temp;
                                                setState(() {});
                                                context
                                                    .read<HomeBloc>()
                                                    .add(SwitchStations());
                                              },
                                              child:
                                                  const Icon(Icons.swap_vert)),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: TextField(
                                              controller: arrival,
                                              onTap: () {
                                                isDepatureField = false;
                                                _isOnFrom = false;
                                                if (!state.isOnSearch) {
                                                  context
                                                      .read<HomeBloc>()
                                                      .add(EnterStationCode());
                                                }
                                              },
                                              onSubmitted: (value) {},
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                suffix: Text(
                                                  state.stationCodeHelper
                                                              .stations[
                                                          state.arrival] ??
                                                      "",
                                                  maxLines: 1,
                                                  style: GoogleFonts.outfit(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .focusColor,
                                                  ),
                                                ),
                                                hintText: "To",
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color: Colors.grey),
                                                // border: OutlineInputBorder(),
                                              ),
                                              onChanged: (value) {
                                                context.read<HomeBloc>().add(
                                                    FilterStations(
                                                        searchTerm: value));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (!state.isOnSearch) ...[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      context.read<HomeBloc>().add(DateSelected(
                                          date: await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime.now().add(
                                                    const Duration(days: 20)),
                                              ) ??
                                              state.date));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            Helper.formatDate(state.date),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.calendar_month),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize:
                                        const Size(double.infinity, 40),
                                    backgroundColor:
                                        Theme.of(context).focusColor,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<HomeBloc>()
                                        .add(GetTrainResults());
                                  },
                                  child: Text(
                                    "Search Trains",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                  ),
                                ),
                              ] else
                                Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: ListView.builder(
                                    itemCount: state.values.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          if (_isOnFrom) {
                                            depature.text = state.values[index];
                                          } else {
                                            arrival.text = state.values[index];
                                          }
                                          FocusScope.of(context).unfocus();
                                          context.read<HomeBloc>().add(
                                                StationCodeSelected(
                                                  stationCode:
                                                      state.values[index],
                                                  isDepatureField:
                                                      isDepatureField,
                                                ),
                                              );
                                        },
                                        child: Container(
                                          padding: index == 0
                                              ? const EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 10,
                                                )
                                              : const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          child: Text(state.values[index]),
                                        ),
                                      );
                                    },
                                  ),
                                )
                            ],
                          ),
                        ),
                        Container(
                          child: Text("Hello world"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!state.isOnSearch)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const PNRstatusScreen(),
                          transition: Transition.fadeIn);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(FontAwesomeIcons.clipboard),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PNR status",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              Text(
                                "check ticket status",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const RunningStatusScreen(),
                          transition: Transition.fadeIn);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(FontAwesomeIcons.train),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Running status",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              Text(
                                "check train status",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
          ],
        );
      },
    );
  }
}
