// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStateInstanceType {
  initial,
  form,
  result,
}

class HomeState {
  final HomeStateInstanceType instance;

  final bool isOnSearch;
  final bool isOnResult;
  final String? depature;
  final String? arrival;
  final DateTime date;
  final List<String> values;
  final StationCodeHelper stationCodeHelper;

  const HomeState({
    required this.instance,
    this.depature,
    this.arrival,
    required this.date,
    required this.values,
    required this.isOnSearch,
    required this.isOnResult,
    required this.stationCodeHelper,
  });

  factory HomeState.initial() {
    return HomeState(
      stationCodeHelper: StationCodeHelper(),
      instance: HomeStateInstanceType.initial,
      date: DateTime.now(),
      values: [],
      isOnSearch: false,
      isOnResult: false,
    );
  }

  HomeState copyWith({
    HomeStateInstanceType? instance,
    StationCodeHelper? stationCodeHelper,
    bool? isOnSearch,
    bool? isOnResult,
    DateTime? date,
    List<String>? values,
    String? depature,
    String? arrival,
  }) {
    return HomeState(
      depature: depature ?? this.depature,
      arrival: arrival ?? this.depature,
      stationCodeHelper: stationCodeHelper ?? this.stationCodeHelper,
      instance: instance ?? this.instance,
      isOnSearch: isOnSearch ?? this.isOnSearch,
      isOnResult: isOnResult ?? this.isOnResult,
      date: date ?? this.date,
      values: values ?? this.values,
    );
  }
}
