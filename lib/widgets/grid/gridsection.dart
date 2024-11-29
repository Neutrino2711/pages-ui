import 'package:flutter/material.dart';
import 'dart:math';

import '../../constants/constants.dart';
import '../../models/gridItem.dart';
import 'animated_grid_card.dart';

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: screenWidth * 0.04,
          mainAxisSpacing: screenWidth * 0.04,
          childAspectRatio: screenWidth * 0.004,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          final item = gridItems[index];
          return AnimatedGridCard(
            item: item,
            index: index,
          );
        },
      ),
    );
  }
}

