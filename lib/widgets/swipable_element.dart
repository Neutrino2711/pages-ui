import 'package:flutter/material.dart';

class SwipableElement extends StatelessWidget {
  const SwipableElement({
    super.key,
    required this.background,
    required this.foreground,
  });

  final String background;
  final String foreground;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            Image.asset(
              background,
              
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*0.15,
              child: Image.asset(
                foreground,
                height: MediaQuery.of(context).size.height*.4,
                // width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        
      ),
    );
  }
}