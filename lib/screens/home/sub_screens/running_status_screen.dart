import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_app/screens/home/sub_screens/widgets/live_status_view.dart';

class RunningStatusScreen extends StatelessWidget {
  const RunningStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 150),
          child: SafeArea(
            child: Container(
              color: Theme.of(context).primaryColorLight,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Running status",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                      ),
                      const SizedBox()
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBar(
                      hintText: 'Enter your train',
                      hintStyle: MaterialStatePropertyAll(
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                      ),
                      elevation: const MaterialStatePropertyAll(0),
                      trailing: [
                        Container(
                          alignment: Alignment.center,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
                              borderRadius: BorderRadius.circular(25)),
                          height: 40,
                          child: Text(
                            "Proceed",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      body: LiveStatusView(20),
    );
  }
}
