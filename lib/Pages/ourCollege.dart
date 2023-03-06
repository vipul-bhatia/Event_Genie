import 'package:flutter/material.dart';

class ourCollege extends StatelessWidget {

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
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Image(
              image: NetworkImage(
                  "https://www.nmimsindore.org/images/nmims-logo1.png"),
            ),
          ),
          const Text(
            "NMIMS University",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: const Text(
              "NMIMS University is a premier educational institute located in Mumbai, India. Established in 1981, it has grown to become one of the leading universities in the country, offering a range of undergraduate, postgraduate and doctoral programs in various fields including engineering, management, commerce, science, and pharmacy. The university is accredited by the University Grants Commission (UGC) and is known for its rigorous academic curriculum, highly qualified faculty, and state-of-the-art infrastructure. NMIMS is committed to providing its students with a comprehensive education and real-world experience, preparing them for successful careers in their chosen fields.",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Times New Roman",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
