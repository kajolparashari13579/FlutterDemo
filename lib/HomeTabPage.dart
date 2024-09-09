import 'package:demoflutter/SharedUtil.dart';
import 'package:demoflutter/TrendingNewsPage.dart';
import 'package:demoflutter/Util/CoreUtil.dart';
import 'package:demoflutter/auth/FireAuth.dart';
import 'package:flutter/material.dart';

import '../../HomePage.dart';

class HomeTabPage extends StatefulWidget {
  HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
    with TickerProviderStateMixin {
  late TabController controller;

  int _selectedIndex = 0;
  String? userName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {
        _selectedIndex = controller.index;
      });
    });
    getUserData();
  }

  // get shared preference data
  getUserData() async {
    userName = await SharedUtil.fetchData("name");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "News Dekho",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          automaticallyImplyLeading: false, // to remove the backpress icon on app bar
          elevation: 5,
          backgroundColor: Colors.amber[200],
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                CoreUtil.showLoaderDialog(context);
                await SharedUtil.clearData();
                await FireAuth.logout(context);
              },
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 0),
                  child: Text("Hi $userName,",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Good Evening",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ),
            DefaultTabController(
                length: 2,
                child: TabBar(
                  controller: controller,
                  tabs: [
                    Tab(text: "Home", icon: Icon(Icons.home)),
                    Tab(
                        text: "Trending",
                        icon: Icon(Icons.trending_down_outlined)),
                  ],
                )),
            Expanded(
              child: Container(
                  child: _selectedIndex == 0 ? HomePage() : TrendingNewsPage()),
            ),
          ],
        ),
      ),
    );
  }
}
