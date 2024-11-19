import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../decorations/custom_color.dart';


class CustomSlideIndicator extends StatelessWidget {
   const CustomSlideIndicator({super.key,required this.pageController});

 final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(
                
                controller: pageController, count: 3,
               effect:  SlideEffect(    
                      spacing:  16.0,    
                      radius:  8.0,    
                      dotWidth:  70.0,    
                      dotHeight:  3.5,    
                      paintStyle:  PaintingStyle.stroke,    
                      strokeWidth:  1.5,    
                      
                      dotColor:  Colors.grey,    
                      activeDotColor:  Theme.of(context).extension<CustomColors>()!.swipeBorderColor,  
                        ), 
                        
              ),
            );
        
  }
}