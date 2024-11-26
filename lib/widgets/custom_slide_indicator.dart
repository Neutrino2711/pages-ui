import 'package:flutter/material.dart';

class CustomSlideIndicator extends StatelessWidget {
  const CustomSlideIndicator({
    super.key,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: List.generate(
       4, // Number of dots matching the items in the carousel
       (index) => AnimatedContainer(
         duration: const Duration(milliseconds: 300),
         width: _currentIndex == index ? 12.0 : 8.0,
         height: 8.0,
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

