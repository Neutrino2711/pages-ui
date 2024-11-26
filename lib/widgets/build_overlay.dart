import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/main_page.dart';


class BuildOverlay extends StatefulWidget {
  BuildOverlay({super.key,required this.isNonVerifiedTap,required this.isLogOutOverlay});

  bool isNonVerifiedTap;
  bool isLogOutOverlay;

  @override
  State<BuildOverlay> createState() => _BuildOverlayState();
}
class _BuildOverlayState extends State<BuildOverlay> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(), 
    child: BackdropFilter(
       filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Center(
        child: SingleChildScrollView(
          child: widget.isLogOutOverlay? LogOutOverlayWidget():VerifyOverlayWidget(screenWidth: screenWidth),
        ),
      ),
    ),
  );
  }
}

class VerifyOverlayWidget extends StatelessWidget {
  const VerifyOverlayWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      // color: Colors.transparent.withOpacity(0.90), // Translucent background
      child: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: screenWidth*0.05, 
            vertical:  screenWidth*0.02,
            ),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.04
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height*0.2,
                  // ),
                  Row(
                    children: [
                      Text('IMPORTANT',
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor
                      ),
                      ),
                      FaIcon(Icons.error,
                      color: Theme.of(context).primaryColor,
                      ),
                      Spacer(),
                      IconButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> MainPage()));
                      }, icon: Icon(Icons.cancel_outlined))
                    ],
                  ),
                 
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width*0.3,
                      child: Image.asset(
                        'assets/images/pana.png', 
                        height: screenWidth * 0.075,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 
                  MediaQuery.of(context).size.width * 0.02
                  ),
                      
                  // OTP Title
                  Text(
                    "Unlock Exclusive Benefits",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                      // fontFamily: "Poppins"
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenWidth*0.02),
                      Container(
                        padding: EdgeInsets.all(
                          screenWidth * 0.04
                        ),
                        decoration: BoxDecoration(
                           color: Theme.of(context).primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(
                            screenWidth  * 0.02,
                          )
                        ),
                        width: screenWidth * 0.85,
                       
                        child: Text("Verify now for exclusive lifetime perks", 
                        style: GoogleFonts.poppins(
                        fontSize: screenWidth*0.035,
                        color: Theme.of(context).primaryColor,
                                           
                                          ),
                        ),
                      ),
                       SizedBox(height: 
                  screenWidth * 0.03
                  ),
                  // Subtitle
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '₹ 2999', // Use the rupee symbol here
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Bold for '₹ 2999'
                            fontSize: screenWidth * 0.05,
                            color: Theme.of(context).primaryColor,
                             // Adjust the font size as needed
                          ),
                        ),
                        TextSpan(
                          text: ' for Lifetime Access (One-Time verification fee)', 
                          style: TextStyle(
                            fontWeight: FontWeight.w700, // Normal weight for the remaining text
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey // Ensure consistent font size
                          ),
                        ),
                      ],
                    ),
                  ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Note:', // The "Note:" part
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Bold for 'Note:'
                        fontSize: screenWidth * 0.04,
                        color: Theme.of(context).primaryColor, // Adjust the font size as needed
                      ),
                    ),
                    TextSpan(
                      text: ' Verification is required for special content access.', 
                      style: TextStyle(
                        fontWeight: FontWeight.normal, // Normal weight for the remaining text
                        fontSize: screenWidth * 0.03, 
                        // Ensure consistent font size
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
              ,
              
                 
                      
                  // OTP Input Fields
                 
                  SizedBox(height: 
                  screenWidth * 0.08
                  ),
                Center(
                  child: ElevatedButton(onPressed: (){
                    
                  }, child: Text("Verify & Unlock New",
                   style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: screenWidth * 0.03,
                            ),
                  ),
                   style: ElevatedButton.styleFrom(
                          minimumSize:  Size(screenWidth * 0.7, screenWidth * 0.15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.05
                            ),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                 SizedBox(height: 
                  screenWidth * 0.05
                  ),
                  // Verify OTP Button
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LogOutOverlayWidget extends StatelessWidget {
  const LogOutOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width ;
    return Container(
      
      height: screenWidth * 0.4,
      width: screenWidth * 0.7 ,
      child: Card(
          color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.all(
            screenWidth * 0.05
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Are you sure you want to Log Out"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MainPage()));
              }, child: Text(
                "No",
                style: GoogleFonts.poppins(
                  
                )
              ),
              style: ElevatedButton.styleFrom(
                      minimumSize:  Size(screenWidth * 0.2, screenWidth * 0.1),
                      side: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).primaryColor
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.02
                        ),
                        
                      ),
                      
                      backgroundColor: Colors.white,
                    ),
              )
              ,
              SizedBox(
                width: screenWidth * 0.04,
              ),
              // Spacer(),
              ElevatedButton(onPressed: (){}, child: Text("Yes",
              style: GoogleFonts.poppins(
                color: Colors.white,

              ),
              ),
              style: ElevatedButton.styleFrom(
                      minimumSize:  Size(screenWidth * 0.2, screenWidth * 0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.02
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
              ),
            ],)
          ],),
        )
      ),
    );
  }
}