import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LastRow extends StatelessWidget {
  const LastRow({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.825,
      child: Card(
        color: Color(0xFFD1E4FF),
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            // right:screenWidth * 0.05,
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Text("Motion Designer",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w600
                  )
                  ),
                  SizedBox(
                    width: screenWidth * 0.001,
                  ),
                  // Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric( horizontal: screenWidth*0.01),
                    child: Icon(
                      Icons.location_on,
                    size: screenWidth*0.03,
                    color: Colors.grey,
                    ),
                  ),
                  Text("Banglore",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth*0.03,
                    color: Colors.grey
                  ),
                  ),
                ],
              ),
             Text("Senior . Fulltime . Remote", 
             style: GoogleFonts.poppins(
              color: Colors.grey
             ),
             ),
              Text("Pinterest, Inc.",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.04
              )
              ),
              Row(children: [
                ElevatedButton(onPressed: (){}, child: Text("Apply Now",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w700
                ),
                ), style: 
                ElevatedButton.styleFrom(
                    minimumSize:  Size(screenWidth * 0.3, screenWidth * 0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        screenWidth * 0.03
                      ),
                    ),
                    backgroundColor: Color(0xFF0F3CC9),
                  ),
                ),
                Spacer(),
                Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                  text: '70K', 
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, // Make '70K' bold
                    fontSize: screenWidth*0.05, // You can set the font size here
                  ),
                        ),
                        TextSpan(
                  text: '/Month', 
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal, // Normal weight for '/month'
                    fontSize: screenWidth * 0.0275,
                    color: Colors.grey // Same font size to match
                  ),
                        ),
                      ],
                    ),
                  )
                  
              ],)
              
            ],
          ),
        ),
      ),
    );
  }
}
