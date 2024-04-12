import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';
import 'package:train_app/screens/home/sub_screens/widgets/find_train_input_fiealds.dart';
import 'package:train_app/screens/home/sub_screens/widgets/train_list_result.dart';
import 'package:train_app/services/ad_services.dart';

class BookTicketScreen extends StatefulWidget {
  const BookTicketScreen({
    super.key,
  });

  @override
  State<BookTicketScreen> createState() => _BookTicketScreenState();
}

class _BookTicketScreenState extends State<BookTicketScreen>
    with TickerProviderStateMixin {
  late TabController controller;
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: AdServices.adUnitId,
      request: const AdRequest(),
      size: const AdSize(width: 300, height: 80),
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
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    loadAd();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (context.read<HomeBloc>().state.isOnResult) {
          context.read<HomeBloc>().add(CancelTrainResult());
          return false;
        }
        return true;
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                context.read<HomeBloc>().state.isOnResult
                    ? Builder(builder: (context) {
                        return Expanded(
                          child: const TrainListResult(),
                        );
                      })
                    : const SingleChildScrollView(
                        child: FindTrainsFieald(),
                      ),
                // if (_bannerAd != null &&
                //     !context.read<HomeBloc>().state.isOnResult)
                //   Align(
                //     alignment: Alignment.bottomCenter,
                //     child: SafeArea(
                //       child: SizedBox(
                //         width: _bannerAd!.size.width.toDouble(),
                //         height: _bannerAd!.size.height.toDouble(),
                //         child: AdWidget(ad: _bannerAd!),
                //       ),
                //     ),
                //   ),
              ],
            ),
          );
        },
      ),
    );
  }
}
