import 'package:flutter/material.dart';
import 'package:movies_app/screens/category.dart';
import 'package:movies_app/screens/home_page.dart';
import 'package:movies_app/screens/movie_detail.dart';
import 'package:movies_app/screens/profile.dart';
import 'package:movies_app/screens/register.dart';
import 'package:movies_app/screens/ui_admin/add_movie.dart';
import 'package:movies_app/screens/ui_admin/category.dart';
import 'package:movies_app/screens/ui_admin/movie_admin.dart';
import 'package:movies_app/screens/video.dart';
import 'package:movies_app/screens/welcome.dart';
import 'package:movies_app/screens/widgets/genre_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF0F111D),
        ),
        routes: {
          "/": (context) => WelcomePage(),
          "registerPage": (context) => RegisterPage(),
          "homePage": (context) => HomePage(),
          // "categoryPage": (context) => CategoryPage(),
          // 'moviePage': (context) => MoviePage(),
          "categoryPage": (context) => CategoryPage(),
          "videoPage": (context) => VideoPage(),
          'genrePage': (context) => GenrePage(),
          'profilePage': (context) => ProfilePage(),
        });
  }
}
