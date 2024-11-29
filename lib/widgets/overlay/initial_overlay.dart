import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialOverlay extends StatefulWidget {
 InitialOverlay({super.key});

  @override
  State<InitialOverlay> createState() => _InitialOverlayState();
}

class _InitialOverlayState extends State<InitialOverlay> {
  ConfettiController _confettiController = ConfettiController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) {
        _confettiController.play();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
          height: screenWidth * 1,
          width: screenWidth * 0.8,
           decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              screenWidth * 0.04
            )
           ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
               
            
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        // width: double.infinity,
                        
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.04
                          )
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width*0.4,
                              width:  MediaQuery.of(context).size.width*0.3,
                              child: Padding(
                                padding:  EdgeInsets.all(
                                  screenWidth * 0.04
                                ),
                                child: Image.asset('assets/images/banner (4) 3.png',
                                // color:  Theme.of(context).primaryColor
                                
                                ),
                              ),
                              
                              ),
                              Expanded(child: Text("Not just a milestone but a masterpiece of success.",
                              style: GoogleFonts.poppins( 
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                              ),
                              ),),
                          ],
                        ),
                      ),
                      Text(
                        "Congratulations!",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                          screenWidth * 0.02
                        ),
                        child: Wrap(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Your Account has Been created",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 0.03,
                              ),
                            ),
                            FaIcon(Icons.check_circle,
                            color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                      Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Your App ID:', // Use the rupee symbol here
                          style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700, // Normal weight for the remaining text
                            fontSize: screenWidth * 0.03,
                            color: Colors.grey,
                             // Adjust the font size as needed
                          ),
                        ),
                        TextSpan(
                          text: ' HM 23458 73432', 
                          style: GoogleFonts.poppins(
                            
                              fontWeight: FontWeight.bold, // Bold for '₹ 2999'
                            fontSize: screenWidth * 0.03,
                            color: Theme.of(context).primaryColor, // Ensure consistent font size
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.04,
                  ),
                TextButton(
      onPressed: () {
    // Your button logic here
      },
      style: TextButton.styleFrom(
    backgroundColor: Colors.white, // Background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        screenWidth * 0.06,
      ), // Rounded corners
      side: BorderSide(
        color: Theme.of(context).primaryColor, // Border color
        width: 1,           // Border width
      ),
    ),
      ),
      child: Text(
    'Continue',
    style: GoogleFonts.poppins(
      color: Theme.of(context).primaryColor, // Text color
      fontSize: screenWidth * 0.04,        // Font size
      fontWeight: FontWeight.w500, // Font weight
    ),
      ),
    )
    
    
                    ],
                  
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirectionality: BlastDirectionality.explosive,
                      shouldLoop: false,
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.pink,
                        Colors.orange,
                        Colors.purple,
                      ],
                      numberOfParticles: 40,
                    ),
                  ),
                ),
              ],
            ),
          
        );
  }
}