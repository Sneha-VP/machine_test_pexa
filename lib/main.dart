// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pexa/views/post_screen.dart';
import 'package:test_pexa/views/home_screen.dart';
import 'package:test_pexa/views/profile_screen.dart';
import 'controllers/post_controller.dart';
import 'controllers/theme_controller.dart';

void main() {
  Get.put(ThemeController());
  final PostController controller = Get.put(PostController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Color(0xFFFFD300),
              unselectedItemColor: Colors.grey,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Color(0xFFFFD300),
              unselectedItemColor: Colors.grey,
            ),
          ),
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
  final screens = [HomeView(), PostsScreen(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Posts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
