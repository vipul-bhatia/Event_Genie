import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/services/firebase_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../Pages/home.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Color(0xFF0F1113),
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF6F6F7),

      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: LottieBuilder.asset(
                                  'Assets/129732-walk-cycle-la-communaute.json',
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Event Genie',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF0F1113),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 30, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Your one-stop-shop for event discovery and planning.',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: AlignmentDirectional(0, 1),
                      //   child: Padding(
                      //     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      //     child: SmoothPageIndicator(
                      //       controller: pageViewController ??=
                      //           PageController(initialPage: 0),
                      //       count: 3,
                      //       axisDirection: Axis.horizontal,
                      //       onDotClicked: (i) {
                      //         pageViewController!.animateToPage(
                      //           i,
                      //           duration: Duration(milliseconds: 500),
                      //           curve: Curves.ease,
                      //         );
                      //       },
                      // effect: ExpandingDotsEffect(
                      //   expansionFactor: 2,
                      //   spacing: 8,
                      //   radius: 16,
                      //   dotWidth: 16,
                      //   dotHeight: 4,
                      //   dotColor: Color(0xFFE0E3E7),
                      //   activeDotColor: Color(0xFF0F1113),
                      //   paintStyle: PaintingStyle.fill,
                      // ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 70),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF613FE5),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                      textStyle: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFFE0E3E7),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
               
                    onPressed: () async{
                  
                     await FirebaseServices().signInWithGoogle();
              
                      Navigator.of(context).pushReplacementNamed("/home");
                
                    },
                    label: Text('Login with Google',style: TextStyle(color: Color(0xFFF6F6F7),
),),
                    icon: Icon(
                      Icons.login,
                      color: Color(0xFFF6F6F7),

                    ),
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
