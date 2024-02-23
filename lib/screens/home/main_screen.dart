// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';
import 'package:train_app/screens/home/sub_screens/book_ticket_screen.dart';
import 'package:train_app/screens/home/sub_screens/find_train_screen.dart';
import 'package:train_app/screens/home/sub_screens/my_ticket_screen.dart';

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
            body: Stack(
              children: [
                Scaffold(
                  backgroundColor:
                      state.isOnSearch ? Colors.white : Colors.transparent,
                  appBar: AppBar(
                    title: Text(
                      "Hii Good Morning 👋",
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    actions:   const [
                    Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      )
                    ],
                    backgroundColor: Theme.of(context).primaryColorLight,
                    bottom: TabBar(
                      isScrollable: true,
                      tabs: [
                        Text(
                          "Book Ticket",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          "My Ticket",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          "Find Train",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
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
                AnimatedPositioned(
                  duration: Duration(milliseconds: 708),
                  curve: Curves.easeInOut,
                  top: state.isOnSearch ? 50 : 130,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    child: TabBarView(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        BookTicketScreen(
                            // onTap: (isOnSearch) {
                            //   if (!isOnSearch) {
                            //     FocusScope.of(context).unfocus();
                            //   }

                            //   setState(() {
                            //     _isOnSearch = isOnSearch;
                            //   });
                            // },//TODO
                            ),
                        FindTrainScreen(),
                        MyTicketScreen(),
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
