import 'package:flutter/material.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/view/home_view.dart';
import 'package:netfliex/view/new_hot_view.dart';
import 'package:netfliex/view/search_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'home',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'search',
              ),
              Tab(
                icon: Icon(Icons.photo_library_outlined),
                text: 'New & Hot',
              )
            ],
            indicatorColor: AppColor.balckColor,
            labelColor: AppColor.whiteColor,
            unselectedLabelColor: Color(0xff999999),
          ),
        ),
        body: TabBarView(children: [Homeview(), SearchPage(), Newview()]),
      ),
    );
  }
}
