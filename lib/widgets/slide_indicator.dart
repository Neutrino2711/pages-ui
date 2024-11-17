import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSlideIndicator extends StatelessWidget {
   CustomSlideIndicator({super.key,required this.pageController});

 final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(
                
                controller: pageController, count: 3,
               effect:  const SlideEffect(    
                      spacing:  16.0,    
                      radius:  8.0,    
                      dotWidth:  70.0,    
                      dotHeight:  4.0,    
                      paintStyle:  PaintingStyle.stroke,    
                      strokeWidth:  1.5,    
                      
                      dotColor:  Colors.grey,    
                      activeDotColor:  Color(0xFFC1272D)    
                        ), 
                        
              ),
            );
        
  }
}