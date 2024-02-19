import 'dart:convert';

import 'package:flutter/services.dart';

class StationCodeHelper {
  StationCodeHelper._();

  static StationCodeHelper? _instance;
  static late final _jsonStaions;
  Map<String, String> _stations = {};

  factory StationCodeHelper() {
    if (_instance == null) {
      _instance = StationCodeHelper._();
      _instance!.loadStations();
    }

    return _instance!;
  }
  Map<String, String> get stations => _stations;

  void loadStations() async {
    String stationsString = await rootBundle.loadString("assets/stations.json");

    _jsonStaions = jsonDecode(stationsString);
    if (_jsonStaions != null) {
      _stations =
          (_jsonStaions['data'] as List).fold<Map<String, String>>({}, (v, k) {
        v[k['name']] = k['code'];
        return v;
      });
    } else {
      print(jsonDecode(stationsString));
    }
  }
}
