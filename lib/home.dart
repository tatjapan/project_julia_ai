import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_julia_ai/common_widgets/custom_app_bar.dart';
import 'package:project_julia_ai/values/values.dart';
import 'package:project_julia_ai/values/my_flutter_app_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  Scaffold buildHomeScreen() {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondaryBackground,
      appBar: CustomAppBar(
        icon: Icon(Icons.settings),
        onPressed: () {
          print("Setting page!");
        },
      ),
      body: SingleChildScrollView(
        controller: pageController,
        child: SizedBox(
          height: 30.0,
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        backgroundColor: AppColors.primaryBackground,
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.newhome),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.message),
            title: Text("Messages"),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.bell),
            title: Text("Notifications"),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.profiles),
            title: Text("Profiles"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildHomeScreen();
  }
}
