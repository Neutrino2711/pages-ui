import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/gridItem.dart';

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Grid of Items'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.5, 
            
          ),
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            final item = gridItems[index];
            return GridCard(item: item,);
          },
        ),
      ),
    );
  }


}

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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: item.colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color(0xFFEAFEF2))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Column for title and subtexts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
      Text(
        item.title,
        style: TextStyle(
          fontSize: screenWidth*0.04,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: screenWidth * 0.01
      ),
      Text(
        item.subTexts,
        style: TextStyle(
          fontSize: screenWidth*0.035,
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
