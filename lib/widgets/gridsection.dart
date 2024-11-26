import 'package:flutter/material.dart';
import 'dart:math';

import '../constants/constants.dart';
import '../models/gridItem.dart';

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.5,
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
      ),
    );
  }
}

class AnimatedGridCard extends StatefulWidget {
  final GridItem item;
  final int index;

  const AnimatedGridCard({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  _AnimatedGridCardState createState() => _AnimatedGridCardState();
}

class _AnimatedGridCardState extends State<AnimatedGridCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    
    _animation = Tween<Offset>(
      begin: Offset(widget.index % 2 == 0 ? -1.0 : 1.0, 0), //left if even, right if odd
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    
    Future.delayed(Duration(milliseconds: 100 * widget.index), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: GridCard(item: widget.item),
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
        border: Border.all(color: Color(0xFFEAFEF2)),
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
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    item.subTexts,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
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
