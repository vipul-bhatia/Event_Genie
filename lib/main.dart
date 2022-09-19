import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './pages/onboarding.dart';
import './Pages/home.dart';
import './Pages/competition.dart';
import './Pages/events.dart';
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
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
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
        '/': (context) => OnboardingScreen(),
        '/home': (context) => HomePage(),
        '/competition': (context) => competitionPage(),
        '/events': (context) => eventsPage(),
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

