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
  final DateTime date;
  final List<String> values;

  const HomeState({
    required this.instance,
    required this.date,
    required this.values,
    required this.isOnSearch,
    required this.isOnResult,
  });

  factory HomeState.initial() {
    return HomeState(
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
  }) {
    return HomeState(
      instance: instance ?? this.instance,
      isOnSearch: isOnSearch ?? this.isOnSearch,
      isOnResult: isOnResult ?? this.isOnResult,
      date: date ?? this.date,
      values: values ?? this.values,
    );
  }
}
