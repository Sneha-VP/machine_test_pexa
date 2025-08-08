// views/profile_view.dart
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFD300),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://static.vecteezy.com/system/resources/thumbnails/024/354/254/small_2x/happy-girl-standing-in-creative-office-illustration-ai-generative-free-photo.jpg")),
            SizedBox(height: 10),
            Text("Sneha VP",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Flutter Developer", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
