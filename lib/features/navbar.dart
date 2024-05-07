
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/core/Utils/text_styles.dart';
import 'package:netfliex/features/Discover/view/discover.dart';
import 'package:netfliex/features/home/view/home_view.dart';
import 'package:netfliex/features/profile/view/user_profile.dart';
import 'package:netfliex/features/search/view/search_page.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<void> getuser() async {
      user = FirebaseAuth.instance.currentUser;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Color(0xFF4B527E).withOpacity(0.5),
              borderRadius: BorderRadius.circular(25)),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                text: 'Discover',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              )
            ],
            dividerColor: Colors.black.withOpacity(0.0),
            indicatorColor:Colors.black.withOpacity(0.0) ,
            labelColor: AppColor.whiteColor,
            unselectedLabelColor: Color(0xff999999),
            labelStyle: getTextbady(fontWeight: FontWeight.w500),
          ),
        ),
        body: TabBarView(children: [Homeview(), SearchPage(), Newview(),ClientProfile()]),
      ),
    );
  }
}
