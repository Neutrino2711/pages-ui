import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:simple_page_indicator/simple_page_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/swipable_element.dart';

class SwipableStartScreen extends StatefulWidget {
  const SwipableStartScreen({super.key});

  @override
  State<SwipableStartScreen> createState() => _SwipableStartScreenState();
}

class _SwipableStartScreenState extends State<SwipableStartScreen> {

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          
          Icons.arrow_back_ios,
          size: 15.0,
          
          ),
        title: Center(child: Image.asset('assets/images/main1.png')),
        actions:const  [Icon(Icons.arrow_forward_ios,
        size: 15.0,
        )],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
       FlutterCarousel(
        
        options: FlutterCarouselOptions(
          controller: FlutterCarouselController(),  
          height: MediaQuery.of(context).size.height*.7,
          aspectRatio: 16/9,
          viewportFraction: 1.0,
          autoPlayAnimationDuration: const Duration(milliseconds: 500),
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayCurve: Curves.easeIn,
          autoPlay: true,
          showIndicator: true,
          slideIndicator: SlidePercentageIndicator(),
          floatingIndicator: false,
        ),
         items:const [ 
             SwipableElement(
            background: 'assets/images/Group 104.png',
            foreground: 'assets/images/Group 99.png',
            ),
             SwipableElement(
            background: 'assets/images/Group 104 (1).png',
            foreground: 'assets/images/Group 210.png',
            ),
             SwipableElement(
            background: 'assets/images/Group 104 (2).png',
            foreground: 'assets/images/Group 211.png',
            ),
            ]
       ),
          
        TextButton(
          onPressed: (){},
          child: const Text("Swipe")
        )
      ],),
    );
  }
}



class SlidePercentageIndicator implements SlideIndicator {

  @override
  Widget build(int currentPage, double pageDelta, int itemCount) {
    return SmoothPageIndicator(
      count: 3,
      controller: PageController(),
    effect:  const SlideEffect(    
      spacing:  8.0,    
      radius:  4.0,    
      dotWidth:  24.0,    
      dotHeight:  16.0,    
      paintStyle:  PaintingStyle.stroke,    
      strokeWidth:  1.5,    
      dotColor:  Colors.grey,    
      activeDotColor:  Colors.indigo    
  ), 
    );
  }
}