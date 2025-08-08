// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';
import '../views/home_screen.dart';
import '../views/post_screen.dart';
import '../views/profile_screen.dart';

void main() {
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.theme,
          home: MainPage(),
        ));
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  final screens = [
    HomeView(),
    PostsScreen(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          selectedItemColor: const Color(0xFFFFD300),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 28),
              activeIcon: Icon(Icons.home, size: 28, color: Color(0xFFFFD300)),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, size: 28),
              activeIcon: Icon(Icons.list, size: 28, color: Color(0xFFFFD300)),
              label: "Posts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 28),
              activeIcon:
                  Icon(Icons.person, size: 28, color: Color(0xFFFFD300)),
              label: "Profile",
            ),
          ],
        ));
  }
}
