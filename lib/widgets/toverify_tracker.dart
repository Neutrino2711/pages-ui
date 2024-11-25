import 'package:flutter/material.dart';

class ToVerifyTrackerWidget extends StatelessWidget {
  const ToVerifyTrackerWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: screenWidth * 0.35,
        width:  screenWidth * 0.8,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            border: Border.all(color: Colors.white,
            width: 1.0
            ),
            borderRadius: BorderRadius.circular(
              screenWidth * 0.025
            )
            
        ),
        
        child: Padding(
          padding: EdgeInsets.all(
            screenWidth * 0.015
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Image.asset('assets/images/home_card_top.png'),
            Image.asset('assets/images/card_flow.png'),
            Image.asset('assets/images/card_bottom.png'),
          ],),
        ),
      ),
    );
  }
}

