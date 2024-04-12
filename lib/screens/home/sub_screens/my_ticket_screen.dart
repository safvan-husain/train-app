import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:train_app/services/ad_services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class MyTicketScreen extends StatefulWidget {
  const MyTicketScreen({super.key});

  @override
  State<MyTicketScreen> createState() => _MyTicketScreenState();
}

class _MyTicketScreenState extends State<MyTicketScreen> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: AdServices.adUnitId,
      request: const AdRequest(),
      size: AdSize.largeBanner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void initState() {
    loadAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: ToggleSwitch(
              minWidth: 100,
              borderWidth: 1,
              borderColor: [
                Theme.of(context).primaryColorLight,
              ],
              activeBorders: [
                Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 2,
                )
              ],
              cornerRadius: 20.0,
              activeBgColors: [
                [Theme.of(context).primaryColorLight],
                [Theme.of(context).primaryColorLight],
                [Theme.of(context).primaryColorLight],
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
              inactiveFgColor: Theme.of(context).primaryColorLight,
              initialLabelIndex: 0,
              totalSwitches: 3,
              labels: ['Active', 'Complete', "Canceled "],
              radiusStyle: true,
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).splashColor, // Color of the shadow
                  spreadRadius: 2, // Spread radius
                  blurRadius: 4, // Blur radius
                  offset: const Offset(0, 3), // Shadow offset
                ),
              ],
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hydrabad",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "chennai express",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Date",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Seat",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Kazipet",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              "Fee : \$23",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "15 February 2024",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "G5",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.yellow,
                        // height: 80,
                        width: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              7,
                              (index) => Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 5,
                                    ),
                                    height: 13,
                                    child: VerticalDivider(
                                      color: Theme.of(context).focusColor,
                                    ),
                                  )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ExpandableCarousel(
            estimatedPageSize: MediaQuery.of(context).size.width,
            options: CarouselOptions(
              showIndicator: false,
              padEnds: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              viewportFraction: 1,
            ),
            items: [1, 2].map((i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () async {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/card_back.png',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context)
                              .size
                              .width, // Set your desired width here
                          height: 170,
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
          if (_bannerAd != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: SizedBox(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
