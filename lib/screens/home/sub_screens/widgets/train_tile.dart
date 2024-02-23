import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TrainTail extends StatelessWidget {
  const TrainTail({super.key});

  @override
  Widget build(BuildContext context) {
    double progressWidth = MediaQuery.of(context).size.width * .4;
    double currentPosition = .9;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
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
                      Text(
                        "Duration 1h 9m",
                        style: Theme.of(context).textTheme.bodySmall,
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
                              left:
                                  progressWidth * (currentPosition * .82) - 10,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "TItil",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              // height: 50,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.greenAccent),
                      color: Color.fromARGB(255, 210, 245, 211),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    height: 30,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "3E",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              "\$25",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "AVL 15",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
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
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
