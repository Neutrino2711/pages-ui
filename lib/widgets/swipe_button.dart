
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:swipe_start/main.dart';

class CustomSwipedButton extends StatelessWidget {
  const CustomSwipedButton({super.key,required this.isDragged,required this.onSwipeStart,required this.onSwipeEnd});

  final isDragged;
  final VoidCallback onSwipeStart,onSwipeEnd;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;


    return   Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isDragged ? null : Colors.white,
                  gradient: isDragged
                      ?customColors.swipeGradient
                      : null,
                  border: Border.all(
                    color: customColors.swipeBorderColor,
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
                  activeThumbColor: customColors.swipeThumbColor,
                  activeTrackColor: Colors.transparent,
                
                  onSwipe: () {},
                  onSwipeStart: onSwipeStart,
                  onSwipeEnd: onSwipeEnd,
                  child: Text(
                    isDragged? "Lets Go": "Swipe to Start",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDragged? Colors.white: Colors.black,
                    ),
                  )
                ),
                
              ),
            );
  }
}




                