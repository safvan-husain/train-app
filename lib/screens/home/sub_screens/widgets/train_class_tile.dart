import 'package:flutter/material.dart';
import 'package:train_app/models/train_class_mode.dart';
import 'package:train_app/models/train_info_model.dart';

class TrainClassTile extends StatelessWidget {
  final TrainClassModel seatInfo;
  const TrainClassTile({
    super.key,
    required this.seatInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.greenAccent),
        color: const Color.fromARGB(255, 210, 245, 211),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                seatInfo.cmpClass,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.green,
                      // fontSize: 12,
                    ),
              ),
              Text(
                "₹${seatInfo.price}",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.green),
              ),
            ],
          ),
          Text(
            "availible",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
