import 'package:flutter/material.dart';

import '../decorations/custom_color.dart';
import '../constants/constants.dart';

class SwipableElement extends StatelessWidget {
   const SwipableElement({
    super.key,
    required this.topTextfirst,
    required this.topTextsecond,
    required this.foreground,
    required this.bottomText,
    required this.isFirst,
  });

  final String topTextfirst;
  final String topTextsecond;
  final String foreground;
  final String bottomText;
  final bool isFirst;

  

  @override
  Widget build(BuildContext context) {

    final TextConstants  textConstants = TextConstants();
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          topTextfirst,
          style: textTheme.headlineSmall,
        ),
        isFirst
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textConstants.kPage1TopTextSecond,
                    style: textTheme.titleLarge, 
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: textConstants.kPage1TopTextSecondFirstHalf, 
                          style: textTheme.titleLarge!.copyWith(
                            color: Colors.black, 
                          ),
                        ),
                        TextSpan(
                          text: textConstants.kPage1TopTextSecondSecondHalf, 
                          style: textTheme.titleLarge!.copyWith(
                            color: customColors.swipeBorderColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Text(
                topTextsecond,
                style: textTheme.titleLarge!.copyWith(
                  color: const Color(0xFF2FA270), 
                ),
              ),
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          foreground,
          height: MediaQuery.of(context).size.height * .4,
        ),
         SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Text(
          bottomText,
          textAlign: TextAlign.center,
          style: textTheme.bodySmall!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ), 
        ),
      ],
    );
  }
}
