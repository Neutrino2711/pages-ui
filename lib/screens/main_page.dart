import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not_verified_screens/screens/about_us.dart';
import 'package:not_verified_screens/screens/home_screen.dart';
import 'package:not_verified_screens/screens/notification_screen.dart';

import '../widgets/build_overlay.dart';

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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  bool isNonVerifiedTap = false;
  List<bool> verifiedIndices = [true,false,false,false,true,true];
  bool isLogoutOverlay = false;

  final List<Widget> _pages = [
   HomePage(),
    Center(child: Text("Search Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Profile Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Profile Page", style: TextStyle(fontSize: 24))),
    NotificationScreen(),
    AboutUs(),

    
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
          //side bar
          _scaffoldKey.currentState?.openDrawer();
        }, icon: Icon(Icons.list,
        color: Colors.white,
        )),
        title: Image.asset('assets/images/title.png'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(onPressed: (){
              _onItemTapped(5);
              //notification screen
              // Navigator.push(context,MaterialPageRoute(builder: (context)=>NotificationScreen()));
            }, icon: Icon(Icons.notifications_active_outlined)),
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
                  // Circular Progress Indicator with Profile Percentage
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: screenWidth * 0.15,
                        width: screenWidth * 0.15,
                        child: CircularProgressIndicator(
                          value: 0.25, // 25%
                          backgroundColor: Colors.grey[300],
                          color: Colors.green,
                          strokeWidth: 6,
                        ),
                      ),
                      Text(
                        '25%', // Profile completion percentage
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  // Profile Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harsh Pawar',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(
                          screenWidth * 0.02,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,
                          color: Theme.of(context).primaryColor
                          ),
                         borderRadius: BorderRadius.circular(
                          screenWidth * 0.1
                         ),
                         
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.verified_user,
                              color: Theme.of(context).primaryColor,
                              size: screenWidth * 0.03,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Text(
                              'Not Verified',
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.01),
                      Text(
                        'HarshPawar@gmail.com',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.07),
              // Verification Card
              Card(
                color: Color(0xFF0F3CC9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'HireMi',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: screenWidth * 0.07,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.01, vertical: screenWidth*0.01),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(
                                screenWidth * 0.02
                              ),
                            ),
                            child: Text(
                              'Get Verified',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: screenWidth*0.03,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Text(
                        'Verify your profile to unlock premium features and lifetime benefits.',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: screenWidth*0.04,
                        ),
                      ),
                      SizedBox(height: screenWidth*0.02),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              screenWidth*0.02
                            ),
                          ),
                        ),
                        child: Text(
                          'Complete your profile & Get started',
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).primaryColor,
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.02),
              // Settings List
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
                    // Divider(),
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
                    
                    // ListTile(
                    //   leading: Icon(Icons.logout),
                    //   title: Text('Log out',
                    //    style: GoogleFonts.poppins(
                    //     fontSize: screenWidth * 0.05
                    //   ),),
                    //    trailing: IconButton(
                    //     onPressed: (){
                        
                    //     },
                    //     icon: Icon(Icons.arrow_forward_ios, size: screenWidth*0.05,color: Theme.of(context).primaryColor)),
                    // ),
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
                      // isNonVerifiedTap = false;
                      
                      // isNonVerifiedTap = false;
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
            bottom: 20,
            left: 20,
            right: 20,
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
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavBarItem(Icons.home, 0),
                    _buildNavBarItem(Icons.cases, 1),
                    _buildNavBarItem(Icons.person, 2),
                    _buildNavBarItem(Icons.checklist_outlined,4),
                    Image.asset('assets/images/grid5.png')
                  ],
                ),
              ),
            ),
          ),
          if(isNonVerifiedTap)  BuildOverlay(isNonVerifiedTap:  isNonVerifiedTap,isLogOutOverlay: isLogoutOverlay,)
          
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Icon(
        icon,
        color: _selectedIndex == index ? Color(0xFF0F3CC9) : Colors.grey,
        size: _selectedIndex == index ? 30 : 24,
      ),
    );
  }

  
}



