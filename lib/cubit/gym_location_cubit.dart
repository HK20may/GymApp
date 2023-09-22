import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_assignment/models/gym_cities_model.dart';
import 'package:wtf_gym_assignment/models/nearest_gym_location_model.dart';
import 'package:wtf_gym_assignment/models/selected_location_model.dart';
import 'package:wtf_gym_assignment/service/fetch_cities_service.dart';
import 'package:wtf_gym_assignment/service/fetch_nearest_gym_location_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
part 'gym_location_state.dart';

class GymLocationCubit extends Cubit<GymLocationState> {
  GymLocationCubit() : super(GymLocationInitial());

  List<NearestGymLocation>? nearestGymLocationList;
  List<NearestGymLocation>? allNearestGymLocationList;
  int selectedGymCategoryIndex = 0;
  List<String>? gymCategoryList;

  List<GymCitiesData>? gymCitiesModelList;
  SelectedLocationModel? selectedLocationModel;

  Position? currentPosition;

  List<String>? fetchedCities;
  String? selectedGymCity;
  List<String>? areaWiseGymList;
  List<String>? allAreaWiseGymList;

  Future<bool> requestLocationPermission() async {
    final PermissionStatus permissionStatus =
        await Permission.locationWhenInUse.status;
    if (permissionStatus != PermissionStatus.granted) {
      var status = await Permission.locationWhenInUse.request();
      if (status == PermissionStatus.granted) {
        currentPosition = await getUserCurrentLocation();
        return true;
      } else {
        return false;
      }
    } else {
      currentPosition = await getUserCurrentLocation();
      return true;
    }
  }

  Future<Position> getUserCurrentLocation() async {
    var position = await GeolocatorPlatform.instance.getCurrentPosition();
    return position;
  }

  Future<void> getNearestGymLocationData(
      {bool currentLocationSelected = true}) async {
    // FetchCitiesService fetchCitiesService = FetchCitiesService();
    emit(NearestGymLocationLoading());
    FetchNearestGymLocationService fetchNearestGymLocationService =
        FetchNearestGymLocationService();
    try {
      final NearestGymLocationModel data =
          await fetchNearestGymLocationService.fetchNearestGymLocation(
              lat: currentLocationSelected
                  ? currentPosition?.latitude ?? 26.9124
                  : selectedLocationModel?.lat ?? 26.9124,
              long: currentLocationSelected
                  ? currentPosition?.longitude ?? 75.7873
                  : selectedLocationModel?.long ?? 75.7873);
      nearestGymLocationList = data.data;
      allNearestGymLocationList = nearestGymLocationList;
      debugPrint(
          'Fetched nearestGymLocationList: ${nearestGymLocationList?[0].address1}');
      getGymCategory();
      emit(NearestGymLocationData(
          nearestGymLocationList: nearestGymLocationList ?? [],
          nearestGymLocationListLength: nearestGymLocationList?.length ?? 0));
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> getGymCities() async {
    FetchCitiesService fetchCitiesService = FetchCitiesService();
    try {
      final GymCitiesModel data = await fetchCitiesService.fetchCities();
      gymCitiesModelList = data.data;
      selectedLocationModel = SelectedLocationModel(
          gymCitiesModelList?[0].city ?? "",
          gymCitiesModelList?[0].popularLocations?[0].location ?? "",
          0,
          0);
      allUniqueCitiesAvailable();
      debugPrint('Fetched gymCitiesModelList: ${gymCitiesModelList?[0].city}');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void allUniqueCitiesAvailable() {
    Set<String> uniqueCityNames = gymCitiesModelList
            ?.map((gymCities) => gymCities.city?.toLowerCase() ?? "")
            .toSet() ??
        <String>{};

    fetchedCities = uniqueCityNames.toList();

    fetchedCities = fetchedCities?.map((city) {
      if (city.isNotEmpty) {
        return city[0].toUpperCase() + city.substring(1);
      } else {
        return city;
      }
    }).toList();
    selectedGymCity = fetchedCities?[0] ?? "Noida";
    selectPopularLocationOfTheCity();
  }

  void getGymCategory() {
    Set<String> uniqueCategoryNames = nearestGymLocationList
            ?.map((location) => location.categoryName ?? "")
            .toSet() ??
        <String>{};

    gymCategoryList = ["All", ...uniqueCategoryNames.toList()];
  }

  void filterGymList(String gymCategorySelected) {
    nearestGymLocationList = allNearestGymLocationList;
    if (gymCategorySelected == "All") {
      nearestGymLocationList = allNearestGymLocationList;
    } else {
      nearestGymLocationList = nearestGymLocationList
          ?.where((gymLocation) =>
              (gymLocation.categoryName ?? "") == gymCategorySelected)
          .toList();
    }
    emit(NearestGymLocationData(
        nearestGymLocationList: nearestGymLocationList ?? [],
        nearestGymLocationListLength: nearestGymLocationList?.length ?? 0));
  }

  void searchGymByName(String searchedText) {
    nearestGymLocationList = allNearestGymLocationList;
    nearestGymLocationList = nearestGymLocationList
        ?.where((gymLocation) =>
            gymLocation.gymName
                ?.toLowerCase()
                .contains(searchedText.toLowerCase()) ??
            false)
        .toList();
    emit(NearestGymLocationData(
        nearestGymLocationList: nearestGymLocationList ?? [],
        nearestGymLocationListLength: nearestGymLocationList?.length ?? 0));
  }

  void selectPopularLocationOfTheCity() {
    if (gymCitiesModelList != null) {
      final selectedCityGyms = gymCitiesModelList
          ?.where((cityData) =>
              cityData.city?.toLowerCase() == selectedGymCity?.toLowerCase())
          .expand((cityData) =>
              cityData.popularLocations
                  ?.map((location) => location.location)
                  .toList() ??
              [])
          .toSet()
          .toList();

      areaWiseGymList = selectedCityGyms?.cast<String>();
      allAreaWiseGymList = areaWiseGymList;
      emit(AreaWiseGymData(
          areaWiseGymList: areaWiseGymList ?? [],
          areaWiseGymListLength: areaWiseGymList?.length ?? 0));
    }
  }

  void searchAreaWiseGym(String searchedText) {
    areaWiseGymList = allAreaWiseGymList;
    areaWiseGymList = areaWiseGymList
        ?.where((areaWiseGym) =>
            areaWiseGym.toLowerCase().contains(searchedText.toLowerCase()))
        .toList();
    emit(AreaWiseGymData(
        areaWiseGymList: areaWiseGymList ?? [],
        areaWiseGymListLength: areaWiseGymList?.length ?? 0));
  }

  void selectedGymAreWise(String selectedGym) async {
    NearestGymLocation? matchedLocation = nearestGymLocationList?.firstWhere(
      (location) => location.address1 == selectedGym,
      orElse: () => NearestGymLocation(),
    );
    selectedLocationModel = SelectedLocationModel(
        matchedLocation?.city,
        matchedLocation?.address1 ?? "",
        double.parse(matchedLocation?.latitude ?? "26.9124"),
        double.parse(matchedLocation?.longitude ?? "75.7873"));
    await getNearestGymLocationData();
  }
}
