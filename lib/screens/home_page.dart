import 'package:flutter/material.dart';
import 'package:movies_app/screens/widgets/cast.dart';
import 'package:movies_app/screens/widgets/custom_navBar.dart';
import 'package:movies_app/screens/widgets/now_playing.dart';
import 'package:movies_app/screens/widgets/popular.dart';
import 'package:movies_app/screens/widgets/search_by_name.dart';
import 'package:movies_app/screens/widgets/up_coming.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Tien',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'What to watch? ',
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'images/profile.jpg',
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ]),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF29B37),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchMovieByName()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white54,
                      ),
                      Container(
                          width: 300,
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            'Search....',
                            style: TextStyle(color: Colors.white54),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              UpComingWidget(),
              SizedBox(
                height: 30,
              ),
              NowPlayingWidget(),
              SizedBox(
                height: 30,
              ),
              PopularMovieWidget(),
              SizedBox(
                height: 30,
              ),
              ActorWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
