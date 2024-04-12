import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:train_app/models/availilble_seat_model.dart';

class SeatBottomSheet extends StatelessWidget {
  final List<AvailibeSeat> seats;
  const SeatBottomSheet(this.seats, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Get.theme.primaryColorDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "TrainName",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "579235794",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "class",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: seats.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  color: Get.theme.primaryColorDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      seats.elementAt(index).date,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      seats.elementAt(index).waitingCategory,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "₹${seats.elementAt(index).price}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 50,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Get.theme.focusColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Book",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        if (seats.elementAt(index).isTaktal)
                          Positioned(
                            top: 0,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Taktal",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
