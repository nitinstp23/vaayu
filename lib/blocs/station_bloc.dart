import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:vaayu/repositories/repositories.dart';
import 'package:vaayu/models/models.dart';

abstract class StationEvent extends Equatable {
  const StationEvent();
}

class FetchStationDetails extends StationEvent {
  final Station station;

  const FetchStationDetails({@required this.station}) : assert(station != null);

  @override
  List<Object> get props => [station];
}

abstract class StationState extends Equatable {
  const StationState();

  @override
  List<Object> get props => [];
}

class StationInitial extends StationState {
  final Station station;
  const StationInitial({this.station});
}

class StationLoading extends StationState {
  const StationLoading();
}

class StationLoaded extends StationState {
  final Station station;
  final List<Measurement> measurements;

  const StationLoaded({
    @required this.station,
    @required this.measurements
  }) : assert(station != null);

  @override
  List<Object> get props => [station];
}

class StationError extends StationState {}

class StationBloc extends Bloc<StationEvent, StationState> {
  final StationRepository stationRepository;

  StationBloc({
    @required this.stationRepository
  }) : assert(stationRepository != null);

  @override
  StationState get initialState => StationInitial();

  @override
  Stream<StationState> mapEventToState(StationEvent event) async* {
    if (event is FetchStationDetails) {
       yield* _mapFetchStationToState(event);
    }
  }

  Stream<StationState> _mapFetchStationToState(FetchStationDetails event) async* {
    yield StationLoading();

    try {
      final List<Measurement> measurements = await stationRepository.getAqiInfo(event.station);
      yield StationLoaded(station: event.station, measurements: measurements);
    } catch (_) {
      yield StationError();
    }
  }
}
