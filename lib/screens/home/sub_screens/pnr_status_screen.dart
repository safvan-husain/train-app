import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PNRstatusScreen extends StatelessWidget {
  const PNRstatusScreen({super.key});

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
                        "PNR status",
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
                      hintText: 'Enter your 10 digit PNR',
                      hintStyle: MaterialStatePropertyAll(
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 16,
                              color: Colors.black,
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
                            "Search",
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
      body: Center(
        child: Text(
          "Your PNR status will be shown here",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
