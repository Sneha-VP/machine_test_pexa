 Flutter Developer Test – Pexa-Carcare
Overview
This project is a Flutter application developed as part of the Pexa-Carcare machine test.
It implements all five given tasks in a single app using GetX for state management, MVC architecture, and a clean UI design with Bottom Navigation.

 Features Implemented
1. Counter & Search (Home Screen)
   Displays a counter starting at 0

Increment and decrement buttons

Warning message (“Cannot go below 0”) if counter reaches 0

Searchable list of 50 countries (real-time filtering)

“Welcome Home” text at the top

Color theme based on the provided screenshot

2. REST API Integration (Posts Screen)
   Fetches posts from: https://jsonplaceholder.typicode.com/posts

Displays first 10 posts in a ListView

Shows loading indicator while fetching data

Each item displays title and body

3. Profile Screen
   Displays a static profile with:

Placeholder image

Name

Bio

“Back” navigation support

4. Dark Mode (Bonus)
   Toggle on the Home Screen to enable dark mode across the app

🛠️ Tools & Packages Used
Flutter (vX.X.X) – UI framework

GetX – State management, navigation, and dependency injection

HTTP – Networking

MVC Pattern – Clear separation of UI, controllers, and models

Dart – Programming language