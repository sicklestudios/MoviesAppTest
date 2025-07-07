// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tentwenty/model/movies_model.dart';
// import 'package:tentwenty/res/widgets/custom_elevated_button.dart';
// import 'package:tentwenty/res/widgets/custom_outlined_button.dart';
// import 'package:tentwenty/res/widgets/custom_text_widgets.dart';

// class MovieDetailScreen extends StatelessWidget {
//   final MovieModel movie;

//   const MovieDetailScreen({super.key, required this.movie});

//   @override
//   Widget build(BuildContext context) {
//     final genres = ['Action', 'Thriller', 'Science', 'Fiction'];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Top Banner with back button and text
//             Stack(
//               children: [
//                 ClipRRect(
//                   child: CachedNetworkImage(
//                     imageUrl:
//                         'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
//                     width: double.infinity,
//                     height: Get.height / 1.8,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   top: 60,
//                   left: 20,
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: Icon(Icons.arrow_back_ios, color: Colors.white),
//                       ),
//                       SizedBox(width: 4),
//                       Text(
//                         "Watch",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 20,
//                   right: 20,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CustomTextWidget(
//                         movie.title,
//                         textAlign: TextAlign.center,
//                         fontSize: 28,
//                         fontWeight: FontWeight.w600,
//                         fontColor: Colors.white,
//                       ),
//                       SizedBox(height: 8),

//                       CustomTextWidget(
//                         "In Theaters ${movie.releaseDate}",
//                         textAlign: TextAlign.center,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         fontColor: Colors.white,
//                       ),
//                       SizedBox(height: 24),
//                       SizedBox(
//                         width: Get.width / 1.3,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CustomElevatedButton(
//                               onPressed: () {},
//                               // style: ElevatedButton.styleFrom(
//                               //   backgroundColor: Color(0xFF61C3F2),
//                               //   padding: EdgeInsets.symmetric(
//                               //     horizontal: 40,
//                               //     vertical: 14,
//                               //   ),
//                               //   shape: RoundedRectangleBorder(
//                               //     borderRadius: BorderRadius.circular(10),
//                               //   ),
//                               // ),
//                               backgroundColor: Color(0xFF61C3F2),
//                               text: "Get Tickets",
//                               // child: Text(
//                               //   'Get Tickets',
//                               //   style: TextStyle(
//                               //     fontSize: 16,
//                               //     fontWeight: FontWeight.w600,
//                               //   ),
//                               // ),
//                             ),
//                             SizedBox(height: 10),
//                             CustomOutlinedButton(
//                               onPressed: () {},

//                               icon: Icon(Icons.play_arrow, color: Colors.white),
//                               text: 'Watch Trailer',
//                               foregroundColor: Colors.white,
//                               // label: Text("Watch Trailer"),
//                               // style: OutlinedButton.styleFrom(
//                               //   padding: EdgeInsets.symmetric(
//                               //     horizontal: 20,
//                               //     vertical: 14,
//                               //   ),
//                               //   side: BorderSide(color: Colors.white),
//                               //   foregroundColor: Colors.white,
//                               //   shape: RoundedRectangleBorder(
//                               //     borderRadius: BorderRadius.circular(10),
//                               //   ),
//                               // ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             SizedBox(height: 24),

//             // Genres
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Genres',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff202C43),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Wrap(
//                 spacing: 5,
//                 children:
//                     genres
//                         .map(
//                           (genre) => Chip(
//                             label: Text(genre),
//                             backgroundColor: _getGenreColor(genre),
//                             labelStyle: TextStyle(color: Colors.white),
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 6,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                         )
//                         .toList(),
//               ),
//             ),

//             SizedBox(height: 24),

//             // Overview
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Overview',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff202C43),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 12),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Text(
//                 movie.overview,
//                 style: TextStyle(
//                   fontSize: 14,
//                   height: 1.6,
//                   color: Color(0xff8F8F8F),
//                 ),
//               ),
//             ),
//             SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }

//   Color _getGenreColor(String genre) {
//     switch (genre.toLowerCase()) {
//       case 'action':
//         return Color(0xFF15D2BC);
//       case 'thriller':
//         return Color(0xFFE26CA5);
//       case 'science':
//         return Color(0xFF564CA3);
//       case 'fiction':
//         return Color(0xFFCD9D0F);
//       default:
//         return Colors.grey;
//     }
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/model/movies_model.dart';
import 'package:tentwenty/res/app_urls.dart';
import 'package:tentwenty/res/utils/utils.dart';
import 'package:tentwenty/res/widgets/custom_elevated_button.dart';
import 'package:tentwenty/res/widgets/custom_outlined_button.dart';
import 'package:tentwenty/res/widgets/custom_text_widgets.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final genres = ['Action', 'Thriller', 'Science', 'Fiction'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout(context, genres)
              : _buildLandscapeLayout(context, genres);
        },
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context, List<String> genres) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildBanner(context, isLandscape: false),
          const SizedBox(height: 24),
          _buildGenres(genres),
          const SizedBox(height: 24),
          _buildOverview(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context, List<String> genres) {
    return Row(
      children: [
        // Left side image
        SizedBox(
          width: Get.width / 2.2,

          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      movie.title,
                      textAlign: TextAlign.center,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      fontColor: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    CustomTextWidget(
                      "In Theaters ${movie.releaseDate}",
                      textAlign: TextAlign.center,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontColor: Colors.white,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: Get.width / 1.3,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              onPressed: () {},
                              backgroundColor: const Color(0xFF61C3F2),
                              text: "Get Tickets",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomOutlinedButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              text: 'Watch Trailer',
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Right side content
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                _buildGenres(genres),
                const SizedBox(height: 24),
                AppUtils.horizontalDivider(),

                const SizedBox(height: 24),
                _buildOverview(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBanner(BuildContext context, {required bool isLandscape}) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
          width: double.infinity,
          height: Get.height / 1.8,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 60,
          left: 20,
          child: Row(
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              const SizedBox(width: 4),
              const Text(
                "Watch",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextWidget(
                movie.title,
                textAlign: TextAlign.center,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontColor: Colors.white,
              ),
              const SizedBox(height: 8),
              CustomTextWidget(
                "In Theaters ${movie.releaseDate}",
                textAlign: TextAlign.center,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontColor: Colors.white,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: Get.width / 1.3,
                child: Column(
                  children: [
                    CustomElevatedButton(
                      onPressed: () {},
                      backgroundColor: const Color(0xFF61C3F2),
                      text: "Get Tickets",
                    ),
                    const SizedBox(height: 10),
                    CustomOutlinedButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      text: 'Watch Trailer',
                      foregroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGenres(List<String> genres) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            'Genres',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontColor: Color(0xff202C43),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 5,
            children:
                genres
                    .map(
                      (genre) => Chip(
                        label: Text(genre),
                        backgroundColor: _getGenreColor(genre),
                        labelStyle: const TextStyle(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff202C43),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            movie.overview,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Color(0xff8F8F8F),
            ),
          ),
        ],
      ),
    );
  }

  Color _getGenreColor(String genre) {
    switch (genre.toLowerCase()) {
      case 'action':
        return const Color(0xFF15D2BC);
      case 'thriller':
        return const Color(0xFFE26CA5);
      case 'science':
        return const Color(0xFF564CA3);
      case 'fiction':
        return const Color(0xFFCD9D0F);
      default:
        return Colors.grey;
    }
  }
}
