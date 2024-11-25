import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/Mail-bro 1.png'),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("NNN: No New Notifications!. Please explore Hiremi application for a while."),
              )
          
            ],
          ),
        ),
      )
    );
  }
}