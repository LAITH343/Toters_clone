import 'package:flutter/material.dart';
import 'package:toters_clone/screens/Butler/ButlerPage.dart';
import 'package:toters_clone/screens/Orders/ordersPage.dart';
import 'package:toters_clone/screens/Profile/profilePage.dart';
import 'package:toters_clone/screens/Search/searchPage.dart';
import 'package:toters_clone/screens/home/HomePage.dart';
import 'package:toters_clone/screens/home/res/appBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _Cindex = 0;

  List<List> catogary = [
    ["images/burger.jpg", "food"],
    ["images/market.png", "market"],
    ["images/wallet.png", "wallet"],
  ];

  @override
  Widget build(BuildContext context) {
    var screens = [
      HomePage(catogary: catogary),
      const SearchScreen(),
      const ButlerPage(),
      const OrdersPage(),
      const ProfilePage()
    ];
    int logedin = 1;
    return Scaffold(
      appBar: _Cindex == 0 ? HomeAppBar(context) : null,
      body: screens[_Cindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _Cindex,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff00cd8e),
        unselectedItemColor: const Color(0xff8f9198),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.personal_injury), label: "Butler"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt,
              ),
              label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
              ),
              label: "Account"),
        ],
        onTap: (index) {
          setState(() {
            _Cindex = index;
          });
        },
      ),
    );
  }
}
