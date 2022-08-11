import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sossu/services/navigation_bar/navigation_bar_provider.dart';

class MyBottomNavibar extends StatefulWidget {
  const MyBottomNavibar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavibar> createState() => _MyBottomNavibarState();
}

class _MyBottomNavibarState extends State<MyBottomNavibar> {
  
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.orangeAccent,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.currentIndex = index;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '팔로잉',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '검색',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '내 정보',
              ),
            ],
          ),
        ),
      );
  }
}