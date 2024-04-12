import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_app/models/train_info_model.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';
import 'package:train_app/screens/home/sub_screens/widgets/live_status_view.dart';
import 'package:train_app/screens/home/sub_screens/widgets/train_tile.dart';

class TrainListResult extends StatelessWidget {
  const TrainListResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      // return SizedBox();
      return Container(
        // color: Colors.red,
        child: ListView.builder(
            itemCount: state.trainList.length + 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "02 feb",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 22),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                            width: 4,
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  "Hydrabad",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.amber,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  "Mumbai",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              right: 8.0,
                              // bottom: 10,
                              left: 10,
                            ),
                            child: Icon(Icons.edit),
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
                                        : BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Theme.of(context)
                                                    .focusColor,
                                              ),
                                            ),
                                          ),
                                    child: Text(
                                      "Fir, 23 ferbruary",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (state.trainList.isEmpty && !state.isLoading)
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          child: Text(
                            "You have no trains",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                    ],
                  ),
                );
              }

              return TrainTail(
                train: state.trainList.elementAt(index - 1),
                liveStatus: () {
                  showModalBottomSheet(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    context: context,
                    builder: (context) => const LiveStatusView(15),
                    // constraints: BoxConstraints(maxHeight: 400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  );
                },
              );
            }),
      );
    });
  }
}
