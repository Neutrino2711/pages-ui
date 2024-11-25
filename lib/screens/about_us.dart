import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.list)),
        title: Text('Help & Support'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(onPressed: (){
              //notification screen
            }, icon: Icon(Icons.notifications_active_outlined)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/women.png'),
            Image.asset('assets/images/text.png'),
          ],
        ),
      )

    );
  }
}