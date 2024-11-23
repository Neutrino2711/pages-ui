import 'package:flutter/material.dart';

import '../widgets/toverify_tracker.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.list)),
        title: Image.asset('assets/images/title.png'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active_outlined)),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.25,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  screenWidth * 0.15
                ),
                bottomRight: Radius.circular(
                  screenWidth * 0.15
                ),
              )
            ),
          child: ToVerifyTrackerWidget(screenWidth: screenWidth),
          ),
        ],
      ),
    );
  }
}

