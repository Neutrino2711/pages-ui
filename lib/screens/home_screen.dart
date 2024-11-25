import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:not_verified_screens/screens/notification_screen.dart';
import 'package:not_verified_screens/widgets/gridsection.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/custom_slide_indicator.dart';
import '../widgets/last_row.dart';
import '../widgets/toverify_tracker.dart';

class HomePage extends StatefulWidget {
   HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  int _currentIndex = 0;
  PageController pageController = PageController();


  final List<String> imagePaths = [
    'assets/images/carousel.png',
    'assets/images/carousel.png',
    'assets/images/carousel.png',
    'assets/images/carousel.png',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // key: _scaffoldKey,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      //   leading: IconButton(onPressed: (){
      //     //side bar
      //     _scaffoldKey.currentState?.openDrawer();
      //   }, icon: Icon(Icons.list)),
      //   title: Image.asset('assets/images/title.png'),
      //   actions: [
      //     CircleAvatar(
      //       backgroundColor: Colors.white,
      //       child: IconButton(onPressed: (){
      //         //notification screen
      //         Navigator.push(context,MaterialPageRoute(builder: (context)=>NotificationScreen()));
      //       }, icon: Icon(Icons.notifications_active_outlined)),
      //     ),
      //   ],
      // ),
      // drawer: Drawer(
      //   backgroundColor: Colors.white,
      //   // width: screenWidth * 0.5,
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text(
      //           'Drawer Header',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.message),
      //         title: const Text('Messages'),
      //         onTap: () {
                
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.account_circle),
      //         title: const Text('Profile'),
      //         onTap: () {
              
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.settings),
      //         title: const Text('Settings'),
      //         onTap: () {
               
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Column(
         
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopSectionHome(screenWidth: screenWidth),
            // SizedBox(
            //   height:  screenWidth * 0.01,
            // ),//later to be removed
           CarouselSlider.builder(
            itemCount: imagePaths.length,
            itemBuilder: (context, index, realIndex) {
              return CarouselItem(
                imagePath: imagePaths[index],
                padding: screenWidth * 0.05,
                borderRadius: 20.0,
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              height: screenWidth * 0.5,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index; // Update the active index
                });
              },
            ),),
           CustomSlideIndicator(currentIndex: _currentIndex),
          Text(
            "Hiremi's Featured"
          ),
          SizedBox(
            height: screenWidth * 1.075,
            width: double.infinity,
            child: GridScreen()),
          Text("Jobs for you"),
          SizedBox(
            height: screenWidth * 0.55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context,builder){
                    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: LastRow(screenWidth: screenWidth),
              );
                },
            ),
          ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: LastRow(screenWidth: screenWidth),
            // ),
            SizedBox(
              height: screenWidth * 0.65,
            )

            
          ],
        ),
      ),
    );
  }
}



  
class TopSectionHome extends StatelessWidget {
  const TopSectionHome({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.25,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            screenWidth * 0.15
          ),
          bottomRight: Radius.circular(
            screenWidth * 0.15
          ),
        )
      ),
    child: ToVerifyTrackerWidget(screenWidth: screenWidth),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final double padding;
  final double borderRadius;

  const CarouselItem({
    Key? key,
    required this.imagePath,
    required this.padding,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}