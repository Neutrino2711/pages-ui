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
        }, icon: Icon(Icons.list)),
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
                children: [
                  // Circular Progress Indicator with Profile Percentage
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: 0.25, // 25%
                        backgroundColor: Colors.grey[300],
                        color: Colors.green,
                        strokeWidth: 6,
                      ),
                      Text(
                        '25%', // Profile completion percentage
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.verified_user,
                            color: Colors.grey,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Not Verified',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'HarshPawar@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Verification Card
              Card(
                color: Color(0xFF0F3CC9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'HireMi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Get Verified',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Verify your profile to unlock premium features and lifetime benefits.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Complete your profile & Get started',
                          style: TextStyle(
                            color: Colors.blue[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Settings List
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Change Password'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About App'),
                      trailing: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                          _onItemTapped(5);
                        },
                        icon: Icon(Icons.arrow_forward_ios, size: 16)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text('Help & Support'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log out'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ],
                ),
              ),
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



