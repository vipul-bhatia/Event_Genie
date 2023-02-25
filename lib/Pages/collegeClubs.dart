import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

// create a dictionary to store the data from the json file
List<dynamic> clubs = [];

class collegeClubs extends StatefulWidget {
  const collegeClubs({super.key});

  @override
  State<collegeClubs> createState() => _collegeClubsState();
}

class _collegeClubsState extends State<collegeClubs> {
  // initState() fetches the data from the clubs.json store in array
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchClubs();
  }

  // fetchClubs() fetches the data from the clubs.json store in array
  fetchClubs() async {
    final response = await rootBundle.loadString('lib/clubs.json');
    final data = json.decode(response);
    setState(() {
      for (var i in data.keys) {
        clubs.add(data[i]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
    
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverSearchAppBar(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // create a list view to display the clubs with image of left and name and description on the right
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: clubs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(clubs[index]['Image']),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                clubs[index]['Name'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // description of the club is very long handle overflow
                              Container(
                                width: 300,
                                height: 60,
                                child: Text(
                                  clubs[index]['Description'],
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    const minSize = 130.0;

    final p1Diff = ((minSize - size.height) * 0.5).truncate().abs();
    path.lineTo(0.0, size.height - p1Diff);

    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, minSize);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) => oldClipper != this;
}

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: 300,
      child: ClipPath(
        clipper: BackgroundWaveClipper(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 350,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 56, 140, 224),
                Color.fromARGB(255, 121, 180, 218)
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    
     
                    Text(
                      'College Clubs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 130;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
