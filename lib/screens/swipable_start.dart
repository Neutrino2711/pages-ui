import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:simple_page_indicator/simple_page_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swipe_start/screens/new.dart';

import '../widgets/swipable_element.dart';

///State will be managed better with Global and Scalable State management tools (BLoC || Provider)
///For Representational purposed setState is used here. 




class SwipableStartScreen extends StatefulWidget {
  const SwipableStartScreen({super.key});

  @override
  State<SwipableStartScreen> createState() => _SwipableStartScreenState();
}

class _SwipableStartScreenState extends State<SwipableStartScreen> {

   final PageController _pageController = PageController();
  
  late Timer _timer;
  int _currentPageIndex = 0;
  final int _totalPages = 3;
  bool isDragged = false;
  Color trackColor = Colors.white;

   @override
  void initState() {
    super.initState();
    
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPageIndex < _totalPages - 1) {
        _currentPageIndex++;
        _pageController.animateToPage(
          _currentPageIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        
            Expanded(
              child: PageView(
                controller: _pageController,
                children: const [ 
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(controller: _pageController, count: 3,
               effect:  const SlideEffect(    
                      spacing:  16.0,    
                      radius:  8.0,    
                      dotWidth:  70.0,    
                      dotHeight:  6.0,    
                      paintStyle:  PaintingStyle.stroke,    
                      strokeWidth:  1.5,    
                      dotColor:  Colors.grey,    
                      activeDotColor:  Color(0xFFC1272D)    
                        ), 
              ),
            ),
        
       
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            decoration: BoxDecoration(
              color: isDragged? null:Colors.white,
              gradient: isDragged? const LinearGradient(
                colors: [
                  Color(0xFFB3242A),
                  Color(0xFFB8252B),
                  Color(0xFF9D1F24),
                  Color(0xFF741A1E),
                  Color(0xFF76181B),
                  Color(0xFF6F161A),
                  Color(0xFF5D1316),
                   
                   ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
              ):null,
      border: Border.all(
        color: const Color(0xFFB5242A), 
        width: 2.0,         
      ),
      borderRadius: BorderRadius.circular(50), 
    ),
            child: SwipeButton(
              height: 60,
              thumbPadding:const EdgeInsets.all(7),
              thumb: const Icon(
                Icons.chevron_right,
                color: Colors.white,
                
              ),
             
              activeThumbColor: Color(0xFFD5151D),
              activeTrackColor: Colors.transparent,
              
              child: isDragged?const Text(
                "Lets Go",
                style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
                ),
              ): const Text(
                "Swipe to Start",
                style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
                ),
              ),
              onSwipe: () {
              
              },
              onSwipeStart: (){
                setState(() {
                  isDragged = true;
                  trackColor = Colors.red;
                });
              },
              onSwipeEnd: (){
                setState(() {
                  isDragged = false;
                  trackColor = Colors.white;

                });
                Navigator.push(context,MaterialPageRoute(builder: (context)=>NewPage()));
              },
            ),
          ),
        )
        
        ],),
      ),
    );
  }
}


