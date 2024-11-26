import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerCard extends StatelessWidget {
  const DrawerCard({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}



