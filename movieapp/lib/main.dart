import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/movie_screen.dart';
import 'screens/add_movie.dart';
import 'screens/user_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/movie': (context) => MovieScreen(),
        '/add_movie': (context) => AddMovieScreen(),
        '/user_data': (context) => UserDataScreen(),
      },
      theme: ThemeData(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Color(0xFF1A1A1A),
      ),
    );
  }
}
