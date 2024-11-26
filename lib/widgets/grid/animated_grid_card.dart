import 'package:flutter/material.dart';

import '../../models/gridItem.dart';
import 'grid_card.dart';

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

