import 'package:flutter/material.dart';
import 'package:movies_app/screens/category.dart';
import 'package:movies_app/screens/home_page.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Icon(
              Icons.home_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryPage()));
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
