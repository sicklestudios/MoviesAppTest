import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tentwenty/model/movies_model.dart';
import 'package:tentwenty/res/utils/utils.dart';
import 'package:tentwenty/res/widgets/custom_text_widgets.dart';
import 'package:tentwenty/view_model/dashboard/dashboard_controller.dart';
import 'package:tentwenty/views/movies/movies_detail_Screen.dart';

class SearchMovieScreen extends StatelessWidget {
  final String search;
  const SearchMovieScreen({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    var mainController = Get.put(DashboardController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mainController.searchMovies(search);
      // Add Your Code here.
    });
    return GetBuilder(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xffF6F6FA),
          appBar: AppBar(
            backgroundColor: const Color(0xffF6F6FA),
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Color(0xff202C43)),
              onPressed: () => Get.back(),
            ),
            title: CustomTextWidget(
              '${controller.searchList.length} Results Found',
              fontColor: Color(0xff202C43),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          body:
              controller.searchList.isEmpty
                  ? AppUtils.getNothingFound("Nothing to show")
                  : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    itemCount: controller.searchList.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final movie = controller.searchList[index];
                      return _MovieItem(movie: movie);
                    },
                  ),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final MovieModel movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movie)),
        );
      },
      child: Row(
        children: [
          // Poster Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',

              height: 90,
              width: 120,
              fit: BoxFit.cover,
              errorWidget:
                  (context, error, stackTrace) => Container(
                    color: Colors.grey,
                    child: Center(child: Icon(Icons.image_not_supported)),
                  ),
            ),
          ),
          const SizedBox(width: 16),
          // Title & Genre
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  movie.title,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontColor: Color(0xff202C43),
                ),
                const SizedBox(height: 4),
                // CustomTextWidget(
                //   movie.genre,
                //   style: const TextStyle(fontSize: 14, color: Color(0xff92929D)),
                // ),
              ],
            ),
          ),
          // const Icon(Icons.more_horiz, color: Color(0xff61C3F2)),
        ],
      ),
    );
  }
}
