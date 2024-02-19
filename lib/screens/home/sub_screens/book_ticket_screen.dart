import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_app/common/helper_methods.dart';
import 'package:train_app/common/widgets/drop_down.dart';
import 'package:train_app/helpers/station_code_helper.dart';

class BookTicketScreen extends StatefulWidget {
  const BookTicketScreen({super.key});

  @override
  State<BookTicketScreen> createState() => _BookTicketScreenState();
}

class _BookTicketScreenState extends State<BookTicketScreen>
    with TickerProviderStateMixin {
  late TabController controller;

  StationCodeHelper _stationCodeHelper = StationCodeHelper();
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

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        width: double.infinity,
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Color of the shadow
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
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "One Way",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: controller.index == 0
                              ? Colors.deepOrange
                              : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Text(
                  "Round Trip",
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 120,
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
                                      margin:
                                          EdgeInsets.only(right: 10, top: 15),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0),
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
                                                style: GoogleFonts.poppins(
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
                                    Icon(Icons.recycling),
                                    Container(
                                      height: 30,
                                      width: 60,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                        right: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0),
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
                                                style: GoogleFonts.poppins(
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
                                  children: [
                                    MyDropDown<String>(
                                      isSearchble: true,
                                      currentValue: null,
                                      values: _stationCodeHelper.stations.keys
                                          .toList(),
                                      hint: 'Depature station',
                                      onChanged: (v) {
                                        setState(() {
                                          from = v ?? from;
                                        });
                                      },
                                    ),
                                    MyDropDown<String>(
                                      isSearchble: true,
                                      currentValue: null,
                                      values: _stationCodeHelper.stations.keys
                                          .toList(),
                                      hint: 'Arrival station',
                                      onChanged: (v) {
                                        setState(() {
                                          to = v ?? to;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate:
                                        DateTime.now().add(Duration(days: 20)),
                                  ) ??
                                  date;
                              setState(() {});
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Helper.formatDate(date),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.calendar_month),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 150,
                              child: MyDropDown<String>(
                                currentValue: 'safn huaflkajfksjfk',
                                isBorderNone: true,
                                values: [
                                  '',
                                  "safn huaflkajfksjfk",
                                ],
                                hint: 'Noc',
                                onChanged: (v) {},
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: MyDropDown<String>(
                                isBorderNone: true,
                                currentValue: 'safn huaflkajfksjfk',
                                values: [
                                  '',
                                  "safn huaflkajfksjfk",
                                ],
                                hint: 'Noc',
                                onChanged: (v) {},
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40),
                            backgroundColor: Colors.deepOrange,
                          ),
                          onPressed: () {},
                          child: Text(
                            "Search Train",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
