import 'package:wtf_gym_assignment/core/helpers/api/api_call_helper.dart';
import 'package:wtf_gym_assignment/models/gym_cities_model.dart';
import 'package:wtf_gym_assignment/models/nearest_gym_location_model.dart';

class FetchNearestGymLocationService {
  final ApiCallHelper<List<GymCitiesModel>> _apiCallHelper = ApiCallHelper();

  Future<dynamic> fetchNearestGymLocation(
      {int page = 1,
      int limit = 30,
      double lat = 26.9124,
      double long = 75.7873}) async {
    String baseUrl =
        'https://devapi.wtfup.me/gym/nearestgym?page=$page&limit=$limit&lat=$lat&long=$long';
    final response = await _apiCallHelper.get(baseUrl);

    if (response.isNotEmpty) {
      return NearestGymLocationModel.fromJson(response);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
