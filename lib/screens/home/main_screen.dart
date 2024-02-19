// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_app/screens/home/sub_screens/book_ticket_screen.dart';
import 'package:train_app/screens/home/sub_screens/find_train_screen.dart';
import 'package:train_app/screens/home/sub_screens/my_ticket_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hii Good Morning 👋",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
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
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                "My Ticket",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Find Train",
                style: Theme.of(context).textTheme.titleMedium,
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
        body: TabBarView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            BookTicketScreen(),
            FindTrainScreen(),
            MyTicketScreen(),
          ],
        ),
      ),
    );
  }
}
