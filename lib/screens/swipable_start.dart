import 'dart:async';

import 'package:flutter/material.dart';

import 'package:swipe_start/screens/new.dart';

import '../widgets/swipable_element.dart';
import '../widgets/slide_indicator.dart';
import '../widgets/swipe_button.dart';

///State will be managed better with Global and Scalable State management tools (BLoC || Provider)
///For Representational purposed setState is used here.
///Following that more refactoring can be achieved hence clearer code
///left app bar arrow is not managed as state yet.

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
      // if (_currentPageIndex < _totalPages - 1) {
      //   _currentPageIndex++;
      //   _pageController.animateToPage(
      //     _currentPageIndex,
      //     duration: const Duration(milliseconds: 500),
      //     curve: Curves.easeInOut,
      //   );
      // } else {
      //   _timer.cancel();
      // }
      if (_currentPageIndex < _totalPages - 1) {
  _currentPageIndex++;
} else {
  _currentPageIndex = 0; // Reset to the first page
}
_pageController.animateToPage(
  _currentPageIndex,
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeInOut,
);

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
        actions:  [
        
      IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: () {
          
        },
      ),
    Expanded(
      child: Center(
        child: Image.asset('assets/images/image 61.png'), 
      ),
    ),
    const Icon(
      Icons.chevron_right,
      size: 25.0,
    ),
        ],
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
                    isFirst: true,
                    topTextfirst: "Nice to see you",
                    topTextsecond: "Welcome to Hiremi",
                    foreground: 'assets/images/Group 99 (1).png',
                    bottomText: "Where your career needs are at your fingertips.",
                  ),
                  SwipableElement(
                    isFirst: false,
                    topTextfirst: "Get Personalized",
                    topTextsecond: "Personal Guidance",
                    foreground: 'assets/images/Group 210 (1).png',
                    bottomText: "Receive tailored advice and insights to help you make the best decisions for your career.",
                  ),
                  SwipableElement(
                    isFirst: false,
                    topTextfirst: "Discover Exclusive",
                    topTextsecond: "Opportunities",
                    foreground: 'assets/images/Group 211 (1).png',
                    bottomText: 'Get personalized job and internship opportunities in various domains tailored to your skills.',

                  ),
                ],
              ),
            ),
            CustomSlideIndicator(pageController: _pageController),
            CustomSwipedButton(isDragged: isDragged, 
            onSwipeStart: (){
                setState(() {
                      isDragged = true;
                      // trackColor = Colors.blue;
                    });
            }, 
              onSwipeEnd: () {
                    setState(() {
                      isDragged = false;
                      trackColor = Colors.white;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewPage()));
                  },
            ),
          
          ],
        ),
      ),
    );
  }
}


