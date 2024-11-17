
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

class CustomSwipedButton extends StatelessWidget {
  const CustomSwipedButton({super.key,required this.isDragged,required this.onSwipeStart,required this.onSwipeEnd});

  final isDragged;
  final VoidCallback onSwipeStart,onSwipeEnd;

  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isDragged ? null : Colors.white,
                  gradient: isDragged
                      ? const LinearGradient(
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
                        )
                      : null,
                  border: Border.all(
                    color: const Color(0xFFB5242A),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SwipeButton(
                  height: 60,
                  thumbPadding: const EdgeInsets.all(7),
                  thumb: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  activeThumbColor: const Color(0xFFD5151D),
                  activeTrackColor: Colors.transparent,
                
                  onSwipe: () {},
                  onSwipeStart: onSwipeStart,
                  onSwipeEnd: onSwipeEnd,
                    child: isDragged
                      ? const Text(
                          "Lets Go",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : const Text(
                          "Swipe to Start",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
                
              ),
            );
  }
}




                