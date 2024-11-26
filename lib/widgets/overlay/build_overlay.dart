import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/main_page.dart';
import 'log_out_overlay.dart';
import 'verify_overlay.dart';


class BuildOverlay extends StatefulWidget {
  BuildOverlay({super.key,required this.isNonVerifiedTap,required this.isLogOutOverlay});

  bool isNonVerifiedTap;
  bool isLogOutOverlay;

  @override
  State<BuildOverlay> createState() => _BuildOverlayState();
}
class _BuildOverlayState extends State<BuildOverlay> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(), 
    child: BackdropFilter(
       filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Center(
        child: SingleChildScrollView(
          child: widget.isLogOutOverlay? LogOutOverlayWidget():VerifyOverlayWidget(screenWidth: screenWidth),
        ),
      ),
    ),
  );
  }
}

