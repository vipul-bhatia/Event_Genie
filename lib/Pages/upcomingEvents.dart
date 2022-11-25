import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class upcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
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
              items: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: Image.network(
                              'https://github.com/vipul-bhatia/nmimsdata/raw/master/events_images/the%20more%20you%20practice%2C%20the%20better%20you%20get..png')
                          .image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: Image.network(
                              'https://github.com/vipul-bhatia/nmimsdata/raw/master/events_images/Untitled%20(3240%20×%201080%20px)%20(3240%20×%201080%20px)%20(3240%20×%201080px).png')
                          .image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: Image.network(
                              'https://github.com/vipul-bhatia/nmimsdata/raw/master/events_images/Forms%20Out!.png')
                          .image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: Image.network(
                              'https://github.com/vipul-bhatia/nmimsdata/raw/master/events_images/Saturday%2010%20am.png')
                          .image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                'Initiatives',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            // Container(
            //   height: 100,
            //   width: double.infinity,
            //   padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
            //   color: Colors.white,
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Initiatives',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 30,
            //     ),
            //   ),
            // ),
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
                      Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 10),
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.black87,
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
                      Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 10),
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.black87,
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
                      Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 10),
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.black87,
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
                      Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 10),
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.black87,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 20),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.black87,
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
              onTap: () {},
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.orange,
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
                children:[ ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: ListTile(
                         tileColor: Colors.black87,
                          leading: CircleAvatar(
                            
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1574914629385-46448b767aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGF0dGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'),
                                
                          ),
                          title: Text(
                            'Event Name',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            'Event Description',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: Text(
                            'Event Date',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }),],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
