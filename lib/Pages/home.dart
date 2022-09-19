import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Pages/competition.dart';
import '../Pages/events.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

void contactsScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/alumini');
  }

  void ourTeamScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/ourTeam');
  }

  void aboutUsScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/aboutUs');
  }

  void newsScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/news');
  }

  void recordingScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/recording');
  }

  void resultsScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/results');
  }

  void feedbackScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/feedback');
  }

    final List<Map<String ,dynamic>> _pages = [
    {'Pages': competitionPage(), 'title': 'Competition'},
    {'Pages': eventsPage(), 'title' : 'Events'},
  ];
   int _SeletedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _SeletedPageIndex = index;
    });
  }
@override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_SeletedPageIndex]['title']),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
            Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Winners Never Quit and Quitters Never Win',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
              height: 20,
              width: 20,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).pushNamed('/aboutUs');
              },
            ),  
            SizedBox(
              height: 20,
              width: 20,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Our Team'),
              onTap: () {
                Navigator.of(context).pushNamed('/ourTeam');
              },
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Alumini of NMIMS'),
              onTap: () {
                Navigator.of(context).pushNamed('/alumini');
              },
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            ListTile(
              leading: Icon(Icons.record_voice_over),
              title: Text('Recordings'),
              onTap: () {
                Navigator.of(context).pushNamed('/recording');
              },
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text('Latest News'),
              onTap: () {
                Navigator.of(context).pushNamed('/news');
              },
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            ListTile(
              leading: Icon(Icons.mark_as_unread),
              title: Text('Results'),
              onTap: () {
                Navigator.of(context).pushNamed('/results');
              },
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              title: Text('Feedback/Suggestions'),
              onTap: () {
                Navigator.of(context).pushNamed('/feedback');
              },
            ),
            ],
          ),
        ),
        body: _pages[_SeletedPageIndex]['Pages'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: _SeletedPageIndex, 
          
          items: [
             BottomNavigationBarItem(
              icon: Icon(Icons.celebration),
              label: 'Competetion',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Events',
            ),
          ],
           ),
      ),
    );
  }
}
