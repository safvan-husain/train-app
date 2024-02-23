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

  final StationCodeHelper _stationCodeHelper = StationCodeHelper();
  String from = '';
  String to = '';
  @override
  void initState() {
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
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

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
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: state.isOnSearch
                ? null
                : [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.5), // Color of the shadow
                      spreadRadius: 2, // Spread radius
                      blurRadius: 4, // Blur radius
                      offset: const Offset(0, 3), // Shadow offset
                    ),
                  ],
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TabBar(
                controller: controller,
                dividerColor: Colors.blue,
                // indicatorWeight: 10,
                indicatorColor: Colors.deepOrange,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "IRTC",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: controller.index == 0
                                ? Colors.deepOrange
                                : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Text(
                    "METRO",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: controller.index == 1
                              ? Colors.deepOrange
                              : Colors.black87,
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
                            height: 150,
                            child: Row(
                              children: [
                                if (_stationCodeHelper.stations
                                        .containsKey(from) &&
                                    _stationCodeHelper.stations
                                        .containsKey(to)) ...[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 60,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                            right: 10, top: 15),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                        ),
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.0),
                                              child: Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 15,
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  _stationCodeHelper
                                                      .stations[from]!,
                                                  maxLines: 1,
                                                  style: GoogleFonts.outfit(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.deepOrange,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.recycling),
                                      Container(
                                        height: 30,
                                        width: 60,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                        ),
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.0),
                                              child: Icon(
                                                Icons.train,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  _stationCodeHelper
                                                      .stations[to]!,
                                                  maxLines: 1,
                                                  style: GoogleFonts.outfit(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.deepOrange,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      TextField(
                                        controller: _fromController,
                                        onTap: () {
                                          _isOnFrom = true;
                                          if (!state.isOnSearch) {
                                            context
                                                .read<HomeBloc>()
                                                .add(EnterStationCode());
                                          }
                                        },
                                        onSubmitted: (value) {
                                          context
                                              .read<HomeBloc>()
                                              .add(StationCodeSelected());
                                        },
                                        decoration: const InputDecoration(
                                            label: Text("From"),
                                            border: OutlineInputBorder()),
                                        onChanged: (value) {
                                          context.read<HomeBloc>().add(
                                              FilterStations(
                                                  searchTerm: value));
                                          // setState(() {});
                                          // values = _stationCodeHelper
                                          //     .stations.keys
                                          //     .where((element) =>
                                          //         element.startsWith(
                                          //             value.toUpperCase()))
                                          //     .toList();
                                        },
                                      ),
                                      InkWell(
                                          onTap: () {
                                            var temp = _fromController.text;
                                            _fromController.text =
                                                _toController.text;
                                            _toController.text = temp;
                                            setState(() {});
                                          },
                                          child: const Icon(Icons.swap_vert)),
                                      TextField(
                                        controller: _toController,
                                        onTap: () {
                                          _isOnFrom = false;
                                          if (!state.isOnSearch) {
                                            context
                                                .read<HomeBloc>()
                                                .add(EnterStationCode());
                                          }
                                        },
                                        onSubmitted: (value) {
                                          context
                                              .read<HomeBloc>()
                                              .add(StationCodeSelected());
                                        },
                                        decoration: const InputDecoration(
                                            label: Text("To"),
                                            border: OutlineInputBorder()),
                                        onChanged: (value) {
                                          context.read<HomeBloc>().add(
                                              FilterStations(
                                                  searchTerm: value));
                                          setState(() {});
                                          // values = _stationCodeHelper
                                          //     .stations.keys
                                          //     .where((element) =>
                                          //         element.startsWith(
                                          //             value.toUpperCase()))
                                          //     .toList();
                                        },
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
                                backgroundColor: Colors.deepOrange,
                              ),
                              onPressed: () {
                                context.read<HomeBloc>().add(GetTrainResults());
                              },
                              child: Text(
                                "Search Train",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
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
                                        _fromController.text =
                                            state.values[index];
                                      } else {
                                        _toController.text =
                                            state.values[index];
                                      }
                                      FocusScope.of(context).unfocus();
                                      context
                                          .read<HomeBloc>()
                                          .add(StationCodeSelected());
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
