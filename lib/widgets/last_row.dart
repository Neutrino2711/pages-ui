import 'package:flutter/material.dart';

class LastRow extends StatelessWidget {
  const LastRow({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.75,
      child: Card(
        color: Color(0xFFD1E4FF),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right:8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      screenWidth * 0.01
                    ),
                    child: Text("Motion Designer",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold
                    )
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.location_on,
                  size: screenWidth*0.015,
                  ),
                  Text("Banglore",
                  style: TextStyle(
                    fontSize: screenWidth*0.03,
                  ),
                  ),
                ],
              ),
             Text("Senior . Fulltime . Remote", 
             style: TextStyle(
              color: Colors.grey
             ),
             ),
              Text("Pinterest, Inc.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )
              ),
              Row(children: [
                ElevatedButton(onPressed: (){}, child: Text("Apply Now",
                style: TextStyle(
                  color: Colors.white,
                ),
                ), style: 
                ElevatedButton.styleFrom(
                    minimumSize:  Size(screenWidth * 0.3, screenWidth * 0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        screenWidth * 0.05
                      ),
                    ),
                    backgroundColor: Color(0xFF0F3CC9),
                  ),
                ),
                Spacer(),
                Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                  text: '70K', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Make '70K' bold
                    fontSize: 16, // You can set the font size here
                  ),
                        ),
                        TextSpan(
                  text: '/month', 
                  style: TextStyle(
                    fontWeight: FontWeight.normal, // Normal weight for '/month'
                    fontSize: 16, // Same font size to match
                  ),
                        ),
                      ],
                    ),
                  )
                  
              ],)
              
            ],
          ),
        ),
      ),
    );
  }
}
