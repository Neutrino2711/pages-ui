import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not_verified_screens/screens/about_us.dart';
import 'package:not_verified_screens/screens/home_screen.dart';
import 'package:not_verified_screens/screens/notification_screen.dart';
import 'package:not_verified_screens/widgets/overlay/initial_overlay.dart';

import '../widgets/drawer_card.dart';
import '../widgets/drawer_user_details.dart';
import '../widgets/overlay/build_overlay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


 bool _showInitialOverlay = true;

  //  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();


     Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _showInitialOverlay = false; 
        });
      }
    });
   
  }

  // void _showConfettiDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return 
  //     },
    // );

    // Play the confetti animation
  
    // Automatically close the dialog after 2 seconds
    // Future.delayed(Duration(seconds: 4), () {
    //   if (mounted) {
    //     Navigator.of(context).pop();
    //   }
    // });
  // }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  bool isNonVerifiedTap = false;
  List<bool> verifiedIndices = [true,false,false,false,true,true];
  bool isLogoutOverlay = false;

  final List<Widget> _pages = [
   HomePage(),
   const  Center(child: Text("Search Page", style: TextStyle(fontSize: 24))),
   const  Center(child: Text("Profile Page", style: TextStyle(fontSize: 24))),
   const  Center(child: Text("Profile Page", style: TextStyle(fontSize: 24))),
   const NotificationScreen(),
   const  AboutUs(),

    
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    if(verifiedIndices[index])
    {
        _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    }
    else {
      setState(() {
        isNonVerifiedTap = true;
      });
    }
    
  }


  

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print(isNonVerifiedTap);
    return Scaffold(
      key: _scaffoldKey,
      appBar: isNonVerifiedTap|| _selectedIndex==4 ||_selectedIndex == 5? null:AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0F3CC9),
        leading: IconButton(onPressed: (){
          
          _scaffoldKey.currentState?.openDrawer();
        }, icon: const Icon(Icons.list,
        color: Colors.white,
        )),
        title: Image.asset('assets/images/title.png'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(onPressed: (){
              _onItemTapped(4);
              //notification screen
              // Navigator.push(context,MaterialPageRoute(builder: (context)=>NotificationScreen()));
            }, icon: const Icon(Icons.notifications_active_outlined)),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: screenWidth * 0.85,
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Header
              SizedBox(
                height: screenWidth * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: screenWidth * 0.15,
                        width: screenWidth * 0.15,
                        child: CircularProgressIndicator(
                          value: 0.25, 
                          backgroundColor: Colors.grey[300],
                          color: Colors.green,
                          strokeWidth: 6,
                        ),
                      ),
                      Text(
                        '25%', 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  
                  DrawerUserDetails(screenWidth: screenWidth),
                ],
              ),
              SizedBox(height: screenWidth * 0.07),
             
              DrawerCard(screenWidth: screenWidth),
              
              SizedBox(height: screenWidth * 0.02),
              Divider(
                height: screenWidth * 0.005,
                color: Colors.grey,
              ),
             
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.list_sharp),
                      title: Text('Settings',
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.05
                      ),
                      ),
                      trailing: IconButton(
                        onPressed: (){
                        
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: screenWidth*0.05,color: Theme.of(context).primaryColor)),
                    ),
                    
                    ListTile(
                      leading: Image.asset(('assets/images/lock_open.png'),
                      height: screenWidth*0.05,
                      ),
                      title: Text('Change Password',
                       style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.05
                      ),
                      ),
                        trailing: IconButton(
                        onPressed: (){
                          
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: screenWidth*0.05,color: Theme.of(context).primaryColor)),
                    ),
                    
                    ListTile(
                      leading: Image.asset('assets/images/assignment.png',
                      height: screenWidth*0.05,
                      ),
                      title: Text('About App',
                       style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.05
                      ),
                      ),
                      trailing: IconButton(
                        onPressed: (){
                         _onItemTapped(4);
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: screenWidth*0.05,color: Theme.of(context).primaryColor)),
                    ),
                    
                    ListTile(
                      leading: Image.asset('assets/images/quick_reference.png',
                      height: screenWidth*0.05,
                      ),
                      title: Text('Help & Support',
                       style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.05
                      ),
                      ),
                      trailing: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                          _onItemTapped(5);
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: screenWidth*0.05,color: Theme.of(context).primaryColor)),
                    ),
                    
                  
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      isNonVerifiedTap = true;
                      isLogoutOverlay = true;
                      Navigator.pop(context);
                      
                    });
                  }, icon: Icon(Icons.logout,color: Theme.of(context).primaryColor,),),
                  Text("Log out",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth*0.05
                  ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pages,
          ),
          Positioned(
            bottom: screenWidth * 0.04,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: Container(
              height: screenWidth*0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    screenWidth * 0.025
                  ),
                  topRight: Radius.circular(
                    screenWidth * 0.025,
                  ),
                  bottomLeft: Radius.circular(
                    screenWidth * 0.1
                  ),
                  bottomRight: Radius.circular(
                    screenWidth * 0.1
                  )
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: screenWidth * 0.1,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: screenWidth * 0.02, horizontal: screenWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavBarItem(Icons.home, 0,"Home",screenWidth),
                    _buildNavBarItem(Icons.cases, 1,"Jobs",screenWidth),
                    _buildNavBarItem(Icons.person, 2,"Ask Experts",screenWidth),
                    _buildNavBarItem(Icons.checklist_outlined,4,"Status",screenWidth),
                    Image.asset('assets/images/grid5.png')
                  ],
                ),
              ),
            ),
          ),
          if(isNonVerifiedTap)  BuildOverlay(isNonVerifiedTap:  isNonVerifiedTap,isLogOutOverlay: isLogoutOverlay,),

       
        if(_showInitialOverlay)  Positioned(
            top: screenWidth * 0.5 ,
            left: screenWidth * 0.1,
            // right: screenWidth * 0.1,
            child: InitialOverlay())
        ],
      ),
    );
  }






  //method for navbarItem

  Widget _buildNavBarItem(IconData icon, int index,String label,double screenWidth) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? Color(0xFF0F3CC9) : Colors.grey,
            size: _selectedIndex == index ? screenWidth * 0.06 : screenWidth * 0.07,
          ),
          Text(label 
          ,
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.03
          ),
          )
        ],
      ),
    );
  }

  
}


