// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:train_app/common/helper_methods.dart';
import 'package:train_app/helpers/station_code_helper.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';

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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
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
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "IRTC",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: controller.index == 0
                                ? Theme.of(context).focusColor
                                : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Text(
                    "METRO",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
                          horizontal: 10, vertical: state.isOnSearch ? 10 : 0),
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
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  width: 40,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 15,
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: VerticalDivider(
                                            indent: 20,
                                            endIndent: 20,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.train,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                if (false)
                                  if (state.depature != null &&
                                      state.arrival != null)
                                    Container(
                                      padding: EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        right: 10,
                                      ),
                                      width: 60,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            state.stationCodeHelper
                                                    .stations[state.depature] ??
                                                "Null",
                                            maxLines: 1,
                                            style: GoogleFonts.outfit(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Theme.of(context).focusColor,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              // child: VerticalDivider(),
                                            ),
                                          ),
                                          Text(
                                            state.stationCodeHelper
                                                    .stations[state.arrival] ??
                                                "Null",
                                            maxLines: 1,
                                            style: GoogleFonts.outfit(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Theme.of(context).focusColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        padding: EdgeInsets.symmetric(
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
                                              state.stationCodeHelper.stations[
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
                                                .copyWith(color: Colors.grey),

                                            // border: OutlineInputBorder(
                                            //     borderSide: BorderSide(
                                            //   color: Colors.grey,
                                            // )),
                                            // prefix: state.depature == null
                                            //     ? null
                                            //     : Container(
                                            //         height: 20,
                                            //         width: 60,
                                            //         alignment: Alignment.center,
                                            //         margin:
                                            //             const EdgeInsets.only(
                                            //           left: 10,
                                            //           right: 10,
                                            //           // bottom: 10,
                                            //         ),
                                            //         decoration: BoxDecoration(
                                            //           border: Border.all(
                                            //               color: Colors.grey),
                                            //         ),
                                            //         child: Row(
                                            //           children: [
                                            //             const Padding(
                                            //               padding:
                                            //                   EdgeInsets.only(
                                            //                       left: 8.0),
                                            //               child: Icon(
                                            //                 Icons.circle,
                                            //                 color: Colors.green,
                                            //                 size: 15,
                                            //               ),
                                            //             ),
                                            //             Expanded(
                                            //               child: Center(
                                            //                 child: Text(
                                            //                   state.stationCodeHelper
                                            //                               .stations[
                                            //                           state
                                            //                               .depature] ??
                                            //                       "",
                                            //                   maxLines: 1,
                                            //                   style: GoogleFonts
                                            //                       .outfit(
                                            //                     fontSize: 8,
                                            //                     fontWeight:
                                            //                         FontWeight
                                            //                             .bold,
                                            //                     color: Theme.of(
                                            //                             context)
                                            //                         .focusColor,
                                            //                   ),
                                            //                 ),
                                            //               ),
                                            //             ),
                                            //           ],
                                            //         ),
                                            //       ),
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
                                          child: const Icon(Icons.swap_vert)),
                                      Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        padding: EdgeInsets.symmetric(
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
                                              state.stationCodeHelper.stations[
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
                                                .copyWith(color: Colors.grey),
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
                                            lastDate: DateTime.now()
                                                .add(const Duration(days: 20)),
                                          ) ??
                                          state.date));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
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
                                minimumSize: const Size(double.infinity, 40),
                                backgroundColor: Theme.of(context).focusColor,
                              ),
                              onPressed: () {
                                context.read<HomeBloc>().add(GetTrainResults());
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
                              height: MediaQuery.of(context).size.height * 0.2,
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
                                              stationCode: state.values[index],
                                              isDepatureField: isDepatureField,
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
                    Container()
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
