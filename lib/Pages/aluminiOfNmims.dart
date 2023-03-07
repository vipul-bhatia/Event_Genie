import 'package:flutter/material.dart';

class aluminiOfNmimsPage extends StatelessWidget {

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
        child: Image.asset('Assets/UnderC.jpg')
      ),
    );
  }
}