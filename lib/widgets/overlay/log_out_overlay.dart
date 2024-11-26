import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/main_page.dart';

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
            Text("Are you sure you want to Log Out",
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            ),
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