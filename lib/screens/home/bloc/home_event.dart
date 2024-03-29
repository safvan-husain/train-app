// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class EnterStationCode implements HomeEvent {}

class StationCodeSelected implements HomeEvent {
  final String stationCode;
  final bool isDepatureField;
  StationCodeSelected({
    required this.stationCode,
    required this.isDepatureField,
  });
}

class DateSelected implements HomeEvent {
  final DateTime date;

  DateSelected({
    required this.date,
  });
}

class FilterStations implements HomeEvent {
  final String searchTerm;
  FilterStations({
    required this.searchTerm,
  });
}

class SwitchStations implements HomeEvent {}

class ShowSettings implements HomeEvent {}

class ShowMainScreen implements HomeEvent {}

class GetTrainResults implements HomeEvent {}

class CancelTrainResult implements HomeEvent {}

class LogOutUser implements HomeEvent {}
