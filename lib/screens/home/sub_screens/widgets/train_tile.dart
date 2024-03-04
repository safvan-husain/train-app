import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TrainTail extends StatelessWidget {
  final Function() liveStatus;
  const TrainTail({
    super.key,
    required this.liveStatus,
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
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          //     // height: 50,
          //     child: ListView.builder(
          //       itemCount: 5,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) {
          //         return Container(
          //           margin: EdgeInsets.only(
          //             left: index == 0 ? 0 : 8,
          //             right: index == 4 ? 0 : 8,
          //             bottom: 10,
          //             top: 10,
          //           ),
          //           decoration: BoxDecoration(
          //             border: Border.all(color: Colors.greenAccent),
          //             color: Color.fromARGB(255, 210, 245, 211),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 10,
          //             vertical: 10,
          //           ),
          //           height: 30,
          //           width: 120,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     "3E",
          //                     style: Theme.of(context).textTheme.bodySmall,
          //                   ),
          //                   Text(
          //                     "\$25",
          //                     style: Theme.of(context).textTheme.bodySmall,
          //                   ),
          //                 ],
          //               ),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     "AVL 15",
          //                     style: Theme.of(context)
          //                         .textTheme
          //                         .bodyLarge!
          //                         .copyWith(color: Colors.green),
          //                   ),
          //                   Text(
          //                     "availible",
          //                     style: Theme.of(context)
          //                         .textTheme
          //                         .bodySmall!
          //                         .copyWith(color: Colors.green),
          //                   ),
          //                 ],
          //               )
          //             ],
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Row _seats(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
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
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "3A - AC 3 Tier",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.green,
                        // fontSize: 12,
                      ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "₹175",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.green),
                    ),
                    Text(
                      "availible",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.green),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            // margin: EdgeInsets.only(
            //   bottom: 10,
            //   top: 10,
            // ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.greenAccent),
              color: const Color.fromARGB(255, 210, 245, 211),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "3E",
                //       style: Theme.of(context).textTheme.bodySmall,
                //     ),
                //     Text(
                //       "\$25",
                //       style: Theme.of(context).textTheme.bodySmall,
                //     ),
                //   ],
                // ),
                Text(
                  "3A - AC 3 Tier",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.green,
                        // fontSize: 12,
                      ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "₹175",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.green),
                    ),
                    Text(
                      "availible",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.green),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
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
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "3A - AC 3 Tier",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.green,
                        // fontSize: 12,
                      ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "₹175",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.green),
                    ),
                    Text(
                      "availible",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.green),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _timeAndDate(
      BuildContext context, double progressWidth, double currentPosition) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "02 feb, fri",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "01 : 05",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                Text("2 h 50 m"),
                Row(
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
                Text("All day"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "02 feb, fri",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "01 : 05",
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
                  "110-Train Exprs",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "78934785",
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
