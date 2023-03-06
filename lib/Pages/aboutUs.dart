import 'package:flutter/material.dart';

class aboutUsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "About Us",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // App Dev logo
              // const Image(
              //   image: AssetImage(""),
              // ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 7 / 8,
                // description
                child: Center(child: Text("The App Development Club is a student-run organization that provides students with an opportunity to explore the world of mobile app development. We believe that everyone should have the tools to create the apps of their dreams, and that’s why we are dedicated to helping our members develop their skills and explore the possibilities of app development. Our members come from all years and experience levels, so there’s something for everyone!! We host workshops and seminars to teach the basics of app development and keep our members up to date with the latest trends. We also hold regular hackathons, where our members can collaborate and create amazing apps. We’re always looking for new ways to help our members improve and grow, and our signature event, Flutter Flight, is designed to do just that. Flutter Flight is an intense event which we have organized teaching students about the application of Flutter and it was filled with knowledge and a pinch of fun. We provide our members with the tools and resources they need to succeed, and we’re always on hand to offer advice and support. At the App Development Club, we want to create a vibrant and supportive community of app developers. We believe that everyone should have the chance to explore the world of app development, and that’s why we’re here to help. Join us and take your app development skills to the next level!",style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Times New Roman",
                
                ),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
