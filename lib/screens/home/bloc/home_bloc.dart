import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:train_app/helpers/station_code_helper.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final StationCodeHelper stationCodeHelper = StationCodeHelper();
  HomeBloc() : super(HomeState.initial()) {
    on<EnterStationCode>((event, emit) {
      emit(state.copyWith(isOnSearch: true));
    });

    on<StationCodeSelected>((event, emit) {
      emit(state.copyWith(isOnSearch: false));
    });

    on<GetTrainResults>((event, emit) {
      emit(state.copyWith(isOnResult: true));
    });

    on<CancelTrainResult>((event, emit) {
      emit(state.copyWith(isOnResult: false));
    });

    on<DateSelected>((event, emit) {
      emit(state.copyWith(date: event.date));
    });

    on<FilterStations>((event, emit) {
      emit(
        state.copyWith(
          values: stationCodeHelper.stations.keys
              .where((element) =>
                  element.startsWith(event.searchTerm.toUpperCase()))
              .toList(),
        ),
      );
    });
  }
}
