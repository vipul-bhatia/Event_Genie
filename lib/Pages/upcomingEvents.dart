import 'dart:io';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Pages/eventDetails.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class upcomingEvents extends StatefulWidget {
  @override
  State<upcomingEvents> createState() => _upcomingEventsState();
}

class _upcomingEventsState extends State<upcomingEvents> {
  // For added events
  List<String> _imageUrls = [];
  List<String> _eventNames = [];
  List<String> _eventTime = [];
  List<String> _eventPlace = [];
  List<String> _eventDescription = [];
  List<String> _eventRegistrationLink = [];

  //For Special Events
  List<String> _lottieLinks = [];
  List<String> _specialEventNames = [];
  List<String> _specialEventDates = [];

  @override
  void initState() {
    super.initState();
    _checkInternetConnection() ;
  }

  bool _isConnected = true;
  Future<void> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
           _isConnected = true;
          _getEvents();
          _getSpecialEvents();
        });
      }
    } on SocketException catch (_) {
      setState(() {
              _isConnected = false;

      });
    }
  }
  




  // For added events
  void _getEvents() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    List<String> urls = [];
    List<String> eventNames = [];
    List<String> eventTimes = [];
    List<String> eventPlaces = [];
    List<String> eventDescriptions = [];
    List<String> eventRegistrationLinks = [];
    snapshot.docs.forEach((doc) {
      var data = doc.data();
      if (data != null && data is Map<String, dynamic>) {
        var imagePath = data['imagePath'];
        var eventName = data['eventName'];
        var eventTime = data['eventTime'];
        var eventPlace = data['eventPlace'];
        var eventDescription = data['shortDescription'];
        var eventRegistrationLink = data['registrationLink'];
        if (imagePath != null &&
            eventName != null &&
            eventTime != null &&
            eventPlace != null &&
            eventDescription != null &&
            eventRegistrationLink != null) {
          urls.add(imagePath);
          eventNames.add(eventName);
          eventTimes.add(eventTime);
          eventPlaces.add(eventPlace);
          eventDescriptions.add(eventDescription);
          eventRegistrationLinks.add(eventRegistrationLink);
        }
      }
    });
    setState(() {
      _imageUrls = urls;
      _eventNames = eventNames;
      _eventTime = eventTimes;
      _eventPlace = eventPlaces;
      _eventDescription = eventDescriptions;
      _eventRegistrationLink = eventRegistrationLinks;
    });
  }

  // For Special Events
  void _getSpecialEvents() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('specialEvents').get();
    List<String> urls = [];
    List<String> eventNames = [];
    List<String> eventDates = [];
    snapshot.docs.forEach((doc) {
      var data = doc.data();
      if (data != null && data is Map<String, dynamic>) {
        var url = data['lottieLink'];
        var eventName = data['eventName'];
        var eventDate = data['eventDate'];
        if (url != null &&
            eventName != null &&
            eventDates != null ) {
          urls.add(url);
          eventNames.add(eventName);
          eventDates.add(eventDate);
        }
      }
    });
    setState(() {
      _lottieLinks = urls;
      _specialEventNames  = eventNames;
      _specialEventDates= eventDates;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F7),
      body: _isConnected ?   SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: _imageUrls.map((url) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 1200),
                autoPlayCurve: Curves.slowMiddle,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                scrollDirection: Axis.horizontal,
              ),
            ),
            // special Events
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _lottieLinks.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Coming Soon'),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFF120E16),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            
                            height: 100,
                            width: 100,
                            child: Lottie.network(
                              _lottieLinks[index],
                              fit: BoxFit.fill,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              _specialEventNames[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            _specialEventDates[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/viewAllEvents");
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF613FE5),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Center(
                  child: Text(
                    'View All Events',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _eventNames.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => eventDetail(
                                      eventName: _eventNames[index],
                                      eventTime: _eventTime[index],
                                      eventPlace: _eventPlace[index],
                                      eventDescription:
                                          _eventDescription[index],
                                      eventImage: _imageUrls[index],
                                      eventRegistrationLink:
                                          _eventRegistrationLink[index],
                                    )),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            tileColor: Color(0xFF120E16),


                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(_imageUrls[index]),
                            ),
                            title: Text(
                              _eventNames[index],
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFFF6F6F7),


                                fontSize: MediaQuery.of(context).size.width *
                                    0.045,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              _eventPlace[index],
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFFF6F6F7),


                                fontSize: MediaQuery.of(context).size.width *
                                    0.035,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Text(
                              _eventTime[index],
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color:Color(0xFFF6F6F7),


                                fontSize: MediaQuery.of(context).size.width *
                                    0.035,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ): 
      Center(
       child: LottieBuilder.asset('Assets/58200-no-internet.json')
      ),
    );
  }
}
