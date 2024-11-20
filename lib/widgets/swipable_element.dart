import 'package:flutter/material.dart';

class SwipableElement extends StatelessWidget {
  const SwipableElement({
    super.key,
    required this.topTextfirst,
    required this.topTextsecond,
    required this.foreground,
    required this.bottomText,
    required this.isFirst
  });

  final String topTextfirst;
  final String topTextsecond;
  final String foreground;
  final String bottomText;
  final bool isFirst;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Text(topTextfirst,
           style: TextStyle(
            color: Color(0xFF6983D9),
            fontSize: 25.0,

           ),
           ),
           isFirst?Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text ("Welcome to ",
               style: TextStyle(
            fontSize: 30.0,
            color: Color(0xFF163EC8),
            fontWeight: FontWeight.w800, 
           ),
              ),
               Text.rich(
                 TextSpan(
                   children: [
                     TextSpan(
                       text: 'Hire', // First part of the word
                       style: TextStyle(
                         color: Colors.black, // Blue color
                         fontSize: 30.0,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                     TextSpan(
                       text: 'mi', // Second part of the word
                       style: TextStyle(
                         color: Color(0xFF163EC8), // Red color
                         fontSize: 30.0,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   ],
                 ),
                 textAlign: TextAlign.center, // Aligns the text if needed
               ),
             ],
           )

            :Text(topTextsecond,
           style: TextStyle(
            fontSize: 30.0,
            color: Color(0xFF2FA270),
            fontWeight: FontWeight.w800, 
           ),
           ),

          SizedBox(
            height: 30,
          ),
           
            Image.asset(
              foreground,
              height: MediaQuery.of(context).size.height*.4,
              
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.center,
              bottomText,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                // color: Colors.grey,
              )
              ),
          ],
        
      ),
    );
  }
}