import 'package:flutter/material.dart';
import 'package:train_app/screens/home/sub_screens/widgets/train_tile.dart';

class TrainListResult extends StatelessWidget {
  const TrainListResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 40,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select your train",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                          // bottom: 10,
                          left: 10,
                        ),
                        child: Icon(Icons.calendar_month_outlined),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: 7,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  left: 5,
                                  right: 10,
                                  top: 10,
                                  bottom: 5,
                                ),
                                decoration: index != 0
                                    ? null
                                    : const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(),
                                        ),
                                      ),
                                child: Text(
                                  "Fir, 23 ferbruary",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const TrainTail();
        });
  }
}
