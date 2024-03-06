import 'package:flutter/material.dart';
import 'package:movies_app/models/cast_list.dart';
import 'package:movies_app/models/movie_detail.dart';
import 'package:movies_app/models/movie_image.dart';
import 'package:movies_app/screens/widgets/cast.dart';
import 'package:movies_app/screens/widgets/comments.dart';
import 'package:movies_app/screens/widgets/custom_navBar.dart';
import 'package:movies_app/screens/widgets/movie_button.dart';
import 'package:movies_app/services/service_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviePage extends StatelessWidget {
  final int movieId;

  const MoviePage({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetail?>(
      future: ServiceProvider.apiService.getMovieDetail(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Lỗi: ${snapshot.error}'));
        } else {
          MovieDetail movieDetail = snapshot.data!;

          // Lấy ảnh từ future
          Future<MovieImage> movieImageFuture =
              ServiceProvider.apiService.getMovieImage(movieId);

          return FutureBuilder<MovieImage>(
            future: movieImageFuture,
            builder: (context, imageSnapshot) {
              if (imageSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (imageSnapshot.hasError) {
                return Center(child: Text('Lỗi: ${imageSnapshot.error}'));
              } else {
                MovieImage movieImage = imageSnapshot.data!;

                return Scaffold(
                  body: Stack(
                    children: [
                      Opacity(
                        opacity: 0.4,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/original/${movieImage.backdrops.isNotEmpty ? movieImage.backdrops[0].imagePath : 'images/img_not_found.jpg'}',
                          height: 280,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.5),
                                          spreadRadius: 0.5,
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/original/${movieImage.posters.isNotEmpty ? movieImage.posters[0].imagePath : 'images/img_not_found.jpg'}',
                                        height: 250,
                                        width: 180,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'videoPage');
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(right: 50, top: 70),
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.red,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.red.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 60,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF292B37),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFF292B37)
                                              .withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Đánh giá',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          ' ${movieDetail.voteAverage}/10', // Thay movieDetail.voteAverage bằng dữ liệu thực tế
                                          style: TextStyle(
                                            color: Colors.yellow[800],
                                            fontSize: 16,
                                            fontFamily: 'muli',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF292B37),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFF292B37)
                                              .withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Lượt xem',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          ' ${movieDetail.voteCount}', // Thay movieDetail.voteCount bằng dữ liệu thực tế
                                          style: TextStyle(
                                            color: Colors.yellow[800],
                                            fontSize: 16,
                                            fontFamily: 'muli',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // ... (các biểu tượng khác nếu cần)
                                ],
                              ),
                            ),
                            // MoviePageButton(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    movieDetail.title,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  ReadMoreText(
                                    movieDetail.overview,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white54,
                                        fontFamily: 'muli'),
                                    trimLines: 3,
                                    colorClickableText: Colors.blue,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: '...Read more',
                                    trimExpandedText: ' show less',
                                    moreStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 120),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Backdrop của phim
                                  Container(
                                    width: double.infinity,
                                    height: 280,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://image.tmdb.org/t/p/original/${movieImage.backdrops.isNotEmpty ? movieImage.backdrops[0].imagePath : 'images/img_not_found.jpg'}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // GestureDetector chơi trailer
                                  GestureDetector(
                                    onTap: () async {
                                      final youtubeUrl =
                                          'https://www.youtube.com/embed/${movieDetail.trailerId}';
                                      if (await canLaunch(youtubeUrl)) {
                                        await launch(youtubeUrl);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Icon(
                                          Icons.play_circle_outline,
                                          color: Colors.yellow,
                                          size: 65,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Release date'.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'muli',
                                      ),
                                    ),
                                    Text(
                                      movieDetail.releaseDate,
                                      style: TextStyle(
                                        color: Colors.yellow[800],
                                        fontSize: 12,
                                        fontFamily: 'muli',
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Run time'.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'muli',
                                      ),
                                    ),
                                    Text(
                                      '${movieDetail.runtime} mins',
                                      style: TextStyle(
                                        color: Colors.yellow[800],
                                        fontSize: 12,
                                        fontFamily: 'muli',
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Budget'.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'muli',
                                      ),
                                    ),
                                    Text(
                                      movieDetail.budget,
                                      style: TextStyle(
                                        color: Colors.yellow[800],
                                        fontSize: 12,
                                        fontFamily: 'muli',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                'Actors'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'muli',
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 200,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    VerticalDivider(
                                  color: Colors.transparent,
                                  width: 5,
                                ),
                                itemCount: movieDetail.castList.length,
                                itemBuilder: (context, index) {
                                  Cast cast = movieDetail.castList[index];
                                  return InkWell(
                                    child: Container(
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 120,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w200${cast.profilePath}',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            cast.name,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            // ActorWidget(movieId: movieId),
                            SizedBox(
                              height: 20,
                            ),
                            CommentWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: CustomNavBar(),
                );
              }
            },
          );
        }
      },
    );
  }
}
