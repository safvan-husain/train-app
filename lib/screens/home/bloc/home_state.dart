// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStateInstanceType {
  initial,
  form,
  result,
  settings,
}

class HomeState {
  final HomeStateInstanceType instance;

  final bool isOnSearch;
  final bool isOnResult;
  final bool isLoading;
  final String? depature;
  final String? arrival;
  final DateTime date;
  final List<TrainInfoModel> trainList;
  final List<String> values;
  final StationCodeHelper stationCodeHelper;

  const HomeState({
    required this.instance,
    this.depature,
    this.isLoading = false,
    this.arrival,
    required this.date,
    required this.values,
    required this.isOnSearch,
    required this.isOnResult,
    required this.stationCodeHelper,
    this.trainList = const [],
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
    bool? isOnSearch,
    bool? isOnResult,
    String? depature,
    String? arrival,
    DateTime? date,
    List<TrainInfoModel>? trainList,
    List<String>? values,
    StationCodeHelper? stationCodeHelper,
    bool? isLoading,
  }) {
    return HomeState(
      instance: instance ?? this.instance,
      isOnSearch: isOnSearch ?? this.isOnSearch,
      isOnResult: isOnResult ?? this.isOnResult,
      isLoading: isLoading ?? this.isLoading,
      depature: depature ?? this.depature,
      arrival: arrival ?? this.arrival,
      date: date ?? this.date,
      trainList: trainList ?? this.trainList,
      values: values ?? this.values,
      stationCodeHelper: stationCodeHelper ?? this.stationCodeHelper,
    );
  }
}
