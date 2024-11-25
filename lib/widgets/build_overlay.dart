import 'dart:ui';

import 'package:flutter/material.dart';
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SizedBox(
                //   height: MediaQuery.of(context).size.height*0.2,
                // ),
                Row(children: [
                  Spacer(),
                  IconButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> MainPage()));
                  }, icon: Icon(Icons.exit_to_app))
                ],),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.5,
                  child: Image.asset(
                    'assets/images/pana.png', 
                    height: screenWidth * 0.075,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 
                MediaQuery.of(context).size.width * 0.01
                ),
                    
                // OTP Title
                Text(
                  "Unlock Exclusive Benefit",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    // fontFamily: "Poppins"
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenWidth*0.01),
                    Container(
                      padding: EdgeInsets.all(
                        screenWidth * 0.02
                      ),
                      decoration: BoxDecoration(
                         color: Colors.blue.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(
                          screenWidth  * 0.02,
                        )
                      ),
                      width: screenWidth * 0.85,
                     
                      child: Text("Verify now for exclusive lifetime perks", 
                      style: GoogleFonts.poppins(
                      fontSize: screenWidth*0.035,
                      color: Colors.blue,
                                         
                                        ),
                      ),
                    ),
                // Subtitle
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '₹ 2999', // Use the rupee symbol here
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Bold for '₹ 2999'
                            fontSize: 16, // Adjust the font size as needed
                          ),
                        ),
                        TextSpan(
                          text: ' for Lifetime Access (One-Time verification fee)', 
                          style: TextStyle(
                            fontWeight: FontWeight.normal, // Normal weight for the remaining text
                            fontSize: screenWidth * 0.04, // Ensure consistent font size
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
Text.rich(
  TextSpan(
    children: [
      TextSpan(
        text: 'Note:', // The "Note:" part
        style: TextStyle(
          fontWeight: FontWeight.bold, // Bold for 'Note:'
          fontSize: screenWidth * 0.02, // Adjust the font size as needed
        ),
      ),
      TextSpan(
        text: ' Verification is required for special content access.', 
        style: TextStyle(
          fontWeight: FontWeight.normal, // Normal weight for the remaining text
          fontSize: screenWidth * 0.02, // Ensure consistent font size
        ),
      ),
    ],
  ),
)
,

               
                    
                // OTP Input Fields
               
                SizedBox(height: 
                screenWidth * 0.04
                ),
              ElevatedButton(onPressed: (){
                
              }, child: Text("Verify & Unlock New",
               style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth * 0.03,
                        ),
              ),
               style: ElevatedButton.styleFrom(
                      minimumSize:  Size(screenWidth * 0.3, screenWidth * 0.15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.05
                        ),
                      ),
                      backgroundColor: Colors.blue,
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
              ElevatedButton(onPressed: (){}, child: Text(
                "No"
              ))
              ,
              Spacer(),
              ElevatedButton(onPressed: (){}, child: Text("Yes")),
            ],)
          ],),
        )
      ),
    );
  }
}