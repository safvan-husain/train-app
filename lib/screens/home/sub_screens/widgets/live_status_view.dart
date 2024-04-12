import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:train_app/services/ad_services.dart';

class LiveStatusView extends StatefulWidget {
  final int count;
  const LiveStatusView(this.count, {super.key});

  @override
  State<LiveStatusView> createState() => _LiveStatusViewState();
}

class _LiveStatusViewState extends State<LiveStatusView> {
  RewardedAd? _rewardedAd;
  int postion = 20;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        postion = 220;
      });
    });
    loadAd();
    super.initState();
  }

  void loadAd() {
    RewardedAd.load(
        adUnitId: AdServices.adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            ad.show(onUserEarnedReward: (canceld, rewaded) {});
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedAd failed to load: $error');
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Divider(
                height: 5,
                thickness: 5,
                indent: 150,
                endIndent: 150,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Train Name",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "048606",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: widget.count * 60,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      widget.count,
                      (index) => Container(
                            width: 70,
                            height: 60,
                            child: Text(
                              "04:30",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            alignment: Alignment.center,
                          )),
                ),
                Stack(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          color: Color.fromARGB(255, 195, 206, 251),
                          width: 10,
                          height: double.infinity,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                              widget.count,
                              (index) => CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 3,
                                  )),
                        ),
                      ],
                    ),
                    AnimatedPositioned(
                      width: 40,
                      duration: Duration(seconds: 1),
                      top: postion.toDouble(),
                      child: Image.asset('assets/icons/train-pin.png'),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                          widget.count,
                          (index) => SizedBox(
                                height: 60,
                                child: ListTile(
                                  title: Text("Train No. $index"),
                                  subtitle: Text(
                                    "$index km Platform",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 16,
                                        ),
                                  ),
                                  trailing: Text(
                                    "04:30",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              )),
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
