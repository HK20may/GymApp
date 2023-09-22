import 'package:wtf_gym_assignment/core/helpers/api/api_call_helper.dart';
import 'package:wtf_gym_assignment/models/gym_cities_model.dart';

class FetchCitiesService {
  final String baseUrl = 'https://devapi.wtfup.me/gym/cities';
  final ApiCallHelper<List<GymCitiesModel>> _apiCallHelper = ApiCallHelper();

  Future<dynamic> fetchCities() async {
    final response = await _apiCallHelper.get(baseUrl);

    if (response.isNotEmpty) {
      return GymCitiesModel.fromJson(response);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
