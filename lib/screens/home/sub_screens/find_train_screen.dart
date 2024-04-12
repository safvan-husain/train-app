import 'package:custom_search_bar/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:train_app/screens/home/sub_screens/widgets/search_trian_tile.dart';
import 'package:train_app/services/ad_services.dart';

class FindTrainScreen extends StatefulWidget {
  const FindTrainScreen({super.key});

  @override
  State<FindTrainScreen> createState() => _FindTrainScreenState();
}

class _FindTrainScreenState extends State<FindTrainScreen> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  @override
  void initState() {
    // showSearchForCustomiseSearchDelegate<String>(
    //   context: context,
    //   // backgroundColor: Colors.yellow,
    //   delegate: SearchScreen<String>(
    //     primaryColor: Colors.white,
    //     seconderyColor: Colors.black,
    //     itemStartsWith: true,
    //     hintText: 'search here',
    //     items: [
    //       'Bike',
    //       'Car',
    //       'Train',
    //     ],
    //     filter: (item) => [item],
    //     itemBuilder: (user) => SearchTrainTile(),
    //   ),
    // );
    super.initState();
    loadAd();
  }

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: AdServices.adUnitId,
      request: const AdRequest(),
      size: AdSize(
        height: Get.width.toInt() - 80,
        width: Get.width.toInt() - 50,
      ),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () => showSearchForCustomiseSearchDelegate<String>(
              context: context,
              // backgroundColor: Colors.yellow,
              delegate: SearchScreen<String>(
                primaryColor: Colors.white,
                seconderyColor: Colors.black,
                itemStartsWith: true,
                hintText: 'search here',
                items: [
                  'Bike',
                  'Car',
                  'Train',
                ],
                filter: (item) => [item],
                itemBuilder: (user) => SearchTrainTile(),
              ),
            ),
            child: Hero(
              tag: 'icon',
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.5), // Color of the shadow
                      spreadRadius: 2, // Spread radius
                      blurRadius: 4, // Blur radius
                      offset: const Offset(0, 3), // Shadow offset
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    const SizedBox(width: 20),
                    Text(
                      "Train number or name",
                      style: Get.theme.textTheme.bodyLarge!
                          .copyWith(color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
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
