import 'package:get/get.dart';
import 'package:tentwenty/data/network_response_model.dart';
import 'package:tentwenty/model/movies_model.dart';
import 'package:tentwenty/repository/home/home_repository.dart';
import 'package:tentwenty/res/utils/utils.dart';
import 'package:tentwenty/view_model/loading_screen_controller.dart';

class DashboardController extends GetxController {
  final HomeRepository _repository = HomeRepository();
  LoadingController loadingController = Get.put(LoadingController());

  var upcomingMoviesList = [];
  var searchList = [];

  @override
  void onReady() {
    super.onReady();
    fetchUpcomingMovies();
  }

  void fetchUpcomingMovies() async {
    try {
      loadingController.setLoad(true);

      NetworkResModel res = await _repository.upcomingMovies();
      print("RES= " + res.response.toString());
      // upcomingMoviesList.value = res.data. ?? [];
      final results = res.response['results'] as List<dynamic>;
      upcomingMoviesList =
          results.map((json) => MovieModel.fromJson(json)).toList();

      update();
    } catch (e) {
      print("ERROR: " + e.toString());
      AppUtils.showGeneralSnackbar("Error", e.toString());
    } finally {
      loadingController.setLoad(false);
    }
  }

  void searchMovies(String search) async {
    try {
      if (search.isEmpty) {
        return;
      }

      loadingController.setLoad(true);

      NetworkResModel res = await _repository.searchMovie(search);
      print("RES= " + res.response.toString());
      // upcomingMoviesList.value = res.data. ?? [];
      final results = res.response['results'] as List<dynamic>;
      searchList = results.map((json) => MovieModel.fromJson(json)).toList();

      update();
    } catch (e) {
      print("ERROR: " + e.toString());
      AppUtils.showGeneralSnackbar("Error", e.toString());
    } finally {
      loadingController.setLoad(false);
    }
  }
}
