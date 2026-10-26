import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bottomNav(BuildContext context) {
  final double bottomInset = MediaQuery.of(context).padding.bottom;
  // Extra elevation padding so the tab items are safely above system navigation bar
  final double bottomPadding = (bottomInset > 0 ? bottomInset : 8) + 0;

  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: bottomPadding),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.88),
          border: Border(
            top: BorderSide(
              color: Colors.black.withValues(alpha: 0.07),
              width: 0.8,
            ),
          ),
        ),
        child: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black38,
          tabs: const [
            Tab(icon: Icon(Icons.home_rounded, size: 26), text: 'Home'),
            Tab(icon: Icon(Icons.bookmark_rounded, size: 26), text: 'Saved'),
            Tab(
              icon: Icon(Icons.notifications_rounded, size: 26),
              text: 'Notifications',
            ),
            Tab(icon: Icon(Icons.person_rounded, size: 26), text: 'Profile'),
          ],
          dividerColor: Colors.transparent,
          labelStyle: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 2.5)),
          ),
        ),
      ),
    ),
  );
}
