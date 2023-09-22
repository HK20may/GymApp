part of 'gym_location_cubit.dart';

abstract class GymLocationState extends Equatable {
  const GymLocationState();

  @override
  List<Object> get props => [];
}

class GymLocationInitial extends GymLocationState {}

class NearestGymLocationLoading extends GymLocationState {}

class NearestGymLocationData extends GymLocationState {
  final List<NearestGymLocation> nearestGymLocationList;
  final int nearestGymLocationListLength;

  const NearestGymLocationData(
      {required this.nearestGymLocationList,
      required this.nearestGymLocationListLength});

  @override
  List<Object> get props =>
      [nearestGymLocationList, nearestGymLocationListLength];
}

class AreaWiseGymData extends GymLocationState {
  final List<String> areaWiseGymList;
  final int areaWiseGymListLength;

  const AreaWiseGymData(
      {required this.areaWiseGymList, required this.areaWiseGymListLength});

  @override
  List<Object> get props => [areaWiseGymList, areaWiseGymListLength];
}
