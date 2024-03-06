import 'package:flutter/material.dart';
import 'package:movies_app/screens/ui_admin/category.dart';
import 'package:movies_app/screens/ui_admin/movie_admin.dart';

class NavBarAdmin extends StatelessWidget {
  const NavBarAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFF292B37),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListMovie()));
            },
            child: Icon(
              Icons.play_arrow_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryAdmin()));
            },
            child: Icon(
              Icons.category_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.favorite_border_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'profilePage');
            },
            child: Icon(
              Icons.person_2_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
