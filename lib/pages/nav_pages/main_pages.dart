import 'package:flutter/material.dart';
import 'package:travel_app/pages/nav_pages/bar_item_pages.dart';
import 'package:travel_app/pages/home_pages.dart';
import 'package:travel_app/pages/nav_pages/my_pages.dart';
import 'package:travel_app/pages/nav_pages/search_pages.dart';

class MainPages extends StatefulWidget {
  const MainPages({Key? key}) : super(key: key);

  @override
  _MainPagesState createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  List navPage = [HomePages(), BarItemPages(), SearchPages(), MyPages()];
  int _currentIndex = 0;

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPage[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(label: '',icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: '',icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: '',icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: '',icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
