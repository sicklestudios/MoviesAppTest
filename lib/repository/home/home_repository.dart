import 'package:get/get.dart';
import 'package:tentwenty/data/network/network_api_service.dart';
import 'package:tentwenty/data/network_response_model.dart';
import 'package:tentwenty/res/app_urls.dart';

class HomeRepository {
  final _api = NetworkApiServices();

  Future<NetworkResModel> upcomingMovies() async {
    var res = await _api.getApi(AppUrls.upcomingUrl);

    return res;
  }

  Future<NetworkResModel> searchMovie(String query) async {
    var res = await _api.getApi("${AppUrls.searchMovie}?query=$query");

    return res;
  }
}
