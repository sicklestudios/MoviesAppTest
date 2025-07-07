import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/res/widgets/custom_text_widgets.dart';
import 'package:tentwenty/view_model/dashboard/dashboard_controller.dart';
import 'package:tentwenty/views/dashboard/search_result.dart';
import 'package:tentwenty/views/movies/movies_detail_Screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title:
            isSearching
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: true,
                    onFieldSubmitted: (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SearchMovieScreen(search: value),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Search TV shows, movies and more',
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(isSearching ? Icons.close : Icons.search),
                        onPressed: () {
                          setState(() {
                            if (isSearching) _searchController.clear();
                            isSearching = !isSearching;
                          });
                        },
                      ),
                      fillColor: const Color(0xFFF2F2F6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                )
                : CustomTextWidget("Watch"),
        actions: [
          if (!isSearching)
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  if (isSearching) _searchController.clear();
                  isSearching = !isSearching;
                });
              },
            ),
        ],
      ),
      body: GetBuilder(
        init: DashboardController(),
        builder: (controller) {
          return OrientationBuilder(
            builder: (context, orientation) {
              final isPortrait = orientation == Orientation.portrait;

              if (isPortrait) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  itemCount: controller.upcomingMoviesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _buildMovieItem(controller.upcomingMoviesList[index]),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                );
              } else {
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  itemCount: controller.upcomingMoviesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 16 / 9,
                  ),
                  itemBuilder: (context, index) {
                    return _buildMovieItem(
                      controller.upcomingMoviesList[index],
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildMovieItem(dynamic movie) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movie)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                fit: BoxFit.cover,
                errorWidget:
                    (context, error, stackTrace) => Container(
                      color: Colors.grey,
                      child: const Center(
                        child: Icon(Icons.image_not_supported),
                      ),
                    ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              child: Text(
                movie.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
