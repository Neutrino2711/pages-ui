import 'package:flutter/material.dart';

class SwipableStartScreen extends StatefulWidget {
  const SwipableStartScreen({super.key});

  @override
  State<SwipableStartScreen> createState() => _SwipableStartScreenState();
}

class _SwipableStartScreenState extends State<SwipableStartScreen> {
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
        size: 10.0,
        )],
      ),
      body: Column(children: [
       const SwipableElement(
          background: 'assets/images/Group 104.png',
          foreground: 'assets/images/Group 99.png',
          ),
          
        TextButton(
          onPressed: (){},
          child: const Text("Swipe")
        )
      ],),
    );
  }
}

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
    return Container(
      child: Stack(
        children: [
          Image.asset(
            background
          ),
          Positioned(
            top: 150,
            child: Image.asset(
              foreground
            ),
          ),
        ],
      )
    );
  }
}