import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Pages/eventDetails.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import '../services/user.dart';

class upcomingEvents extends StatefulWidget {
  @override
  State<upcomingEvents> createState() => _upcomingEventsState();
}

class _upcomingEventsState extends State<upcomingEvents> {
  List<String> _imageUrls = [];
  List<String> _eventNames = [];
  List<String> _eventTime = [];
  List<String> _eventPlace = [];
  List<String> _eventDescription = [];
  List<String> _eventRegistrationLink = [];

  @override
  void initState() {
    super.initState();
    _getImageUrls();
  }

  void _getImageUrls() async {
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
      else{
       Center(
            child:LottieBuilder.network('https://assets7.lottiefiles.com/packages/lf20_yodwwn2k.json')
          );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F7),

      // Color(0xFF3F7396),
     // Color(0xFF317ac7),
      body: SingleChildScrollView(
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
                // return Container(
                //   child: Image.network(url),
                // );
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
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Coming Soon'),
                            ),

                          );
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 10),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFF120E16),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LottieBuilder.network(
                                  'https://assets10.lottiefiles.com/packages/lf20_keoed4f6.json',
                                  height: 90,
                                  width: 90),
                              Text(
                                'Cultural',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Octobar 21',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Coming Soon'),
                            ),

                          );
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 10),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFF120E16),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LottieBuilder.network(
                                  'https://assets2.lottiefiles.com/packages/lf20_VAcXFj87ku.json',
                                  height: 90,
                                  width: 90),
                              Text(
                                'Marketers Meet',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'November 22',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Coming Soon'),
                            ),

                          );
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 10),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFF120E16),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LottieBuilder.network(
                                  'https://assets2.lottiefiles.com/packages/lf20_BgywoUBeiL.json',
                                  height: 90,
                                  width: 90),
                              Text(
                                'Community Learning',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'January 22',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Coming Soon'),
                            ),

                          );
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 10),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFF120E16),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LottieBuilder.network(
                                  'https://assets10.lottiefiles.com/packages/lf20_yMpiqXia1k.json',
                                  height: 90,
                                  width: 90),
                              Text(
                                'Stocks Analysis',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'December 22',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Coming Soon'),
                            ),

                          );
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 20),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFF120E16),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LottieBuilder.network(
                                  'https://assets10.lottiefiles.com/packages/lf20_keoed4f6.json',
                                  height: 90,
                                  width: 90),
                              Text(
                                'Cultural',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Octobar 21',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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


                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              _eventPlace[index],
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFFF6F6F7),


                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Text(
                              _eventTime[index],
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color:Color(0xFFF6F6F7),


                                fontSize: 15,
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
      ),
    );
  }
}
