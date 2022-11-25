import 'package:flutter/material.dart';


import './Pages/onboardingscreen.dart';
import './Pages/home.dart';
import 'Pages/upcomingEvents.dart';
import 'Pages/calander.dart';
import './Pages/aluminiOfNmims.dart';
import './Pages/ourTeam.dart';
import './Pages/aboutUs.dart';
import './Pages/news.dart';
import './Pages/recording.dart';
import './Pages/results.dart';
import './Pages/feedback.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentIconTheme: IconThemeData(color: Colors.orange),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        accentColor: Colors.indigo,
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NMIMS Shirpur',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingPage(),
        '/home': (context) => HomePage(),
        '/competition': (context) => upcomingEvents(),
        '/events': (context) => CalanderScreen(),
        '/alumini': (context) => aluminiOfNmimsPage(),
        '/ourTeam': (context) => ourTeamPage(),
        '/aboutUs': (context) => aboutUsPage(),
        '/news': (context) => newsPage(),
        '/recording': (context) => recordingPage(),
        '/results': (context) => resultsPage(),
        '/feedback': (context) => feedbackPage(),
      },
    );
  }
}

