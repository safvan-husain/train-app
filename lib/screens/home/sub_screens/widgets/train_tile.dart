import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_app/models/train_info_model.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';
import 'package:train_app/screens/home/sub_screens/widgets/train_class_tile.dart';

class TrainTail extends StatelessWidget {
  final TrainInfoModel train;
  final Function() liveStatus;
  const TrainTail({
    super.key,
    required this.liveStatus,
    required this.train,
  });

  @override
  Widget build(BuildContext context) {
    double progressWidth = MediaQuery.of(context).size.width * .4;
    double currentPosition = .9;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      // height: 160,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _trainNameAndProgress(context, progressWidth, currentPosition),
          _timeAndDate(context, progressWidth, currentPosition),
          _seats(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "View tatkal availiblity",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.blue),
                ),
                Text(
                  "Check latest availiblity",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _seats(BuildContext context) {
    if (train.seats.length != 3) {
      return SizedBox(
        height: 70,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // height: 50,
          child: ListView.builder(
            itemCount: train.seats.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    HomeBloc.instance.add(CheckSeatAvailiblity());
                  },
                  child:
                      TrainClassTile(seatInfo: train.seats.elementAt(index)));
            },
          ),
        ),
      );
    }
    return SizedBox(
      height: 70,
      child: Row(
        children: List.generate(
          train.seats.length,
          (index) => Expanded(
            child: InkWell(
              onTap: () {
                HomeBloc.instance.add(CheckSeatAvailiblity());
              },
              child: TrainClassTile(
                seatInfo: train.seats.elementAt(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _timeAndDate(
      BuildContext context, double progressWidth, double currentPosition) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  train.startDate,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  train.startTime,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(train.duration),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                    ),
                    Expanded(child: Divider()),
                    CircleAvatar(
                      radius: 3,
                    ),
                  ],
                ),
                Text(train.runningDays),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  train.endDate,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  train.endTime,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _trainNameAndProgress(
      BuildContext context, double progressWidth, double currentPosition) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  train.trainName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  train.trainNumber,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Text("Heading"),
                SizedBox(
                  width: progressWidth,
                  child: Stack(
                    children: [
                      Positioned(
                        left: progressWidth * (currentPosition * .82) - 10,
                        child: const Icon(
                          Icons.location_pin,
                          size: 20,
                          color: Colors.redAccent,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: Text(
                          "On the way train",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          // left: 10,
                          right: 10,
                        ),
                        child: LinearProgressIndicator(
                          value: currentPosition,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: liveStatus,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "See live status",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.blue,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
