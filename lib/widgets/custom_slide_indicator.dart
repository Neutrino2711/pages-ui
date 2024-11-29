import 'package:flutter/material.dart';

class CustomSlideIndicator extends StatelessWidget {
  const CustomSlideIndicator({
    super.key,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: List.generate(
       4, // Number of dots matching the items in the carousel
       (index) => AnimatedContainer(
         duration: const Duration(milliseconds: 300),
         width: _currentIndex == index ? screenWidth*0.02 : screenWidth *0.02,
         height: screenWidth * 0.02,
         margin: const EdgeInsets.symmetric(horizontal: 4.0),
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: _currentIndex == index
               ? Color(0xFF0F3CC9)
               : Colors.grey.shade400, // Highlight the active dot
         ),
       ),
     ),
            );
  }
}

