import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerUserDetails extends StatelessWidget {
  const DrawerUserDetails({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
