import 'package:flutter/material.dart';

import '../../models/gridItem.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    super.key,
    required this.item,
  });

  final GridItem item;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // height: screenWidth * 0.1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: item.colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(
          screenWidth * 0.04
        ),
        border: Border.all(color: item.colors[0]),
      ),
      child: Padding(
        padding:  EdgeInsets.all(screenWidth * 0.015),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Column for title and subtexts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    item.subTexts,
                    style: TextStyle(
                      fontSize: screenWidth * 0.0275,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            // Image on the right
            Center(
              child: SizedBox(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                child: Image.asset(
                  item.imageDir,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
