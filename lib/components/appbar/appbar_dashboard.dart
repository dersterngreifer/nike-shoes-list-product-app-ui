import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appBarDashboard(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top + 12,
      left: 24,
      right: 24,
      bottom: 12,
    ),
    child: Row(
      children: [
        // Menu button
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.menu_rounded, color: Colors.white, size: 22),
        ),
        const SizedBox(width: 16),

        // Search field - expanded
        Expanded(
          child: TextField(
            cursorColor: Colors.black,
            style: GoogleFonts.poppins(fontSize: 14),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Colors.black38,
                size: 22,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune_rounded,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
              hintText: 'Search shoes...',
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black38,
              ),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              fillColor: const Color(0xFFF4F4F4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),

        // Cart button
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.shopping_bag_rounded,
                color: Colors.black,
                size: 22,
              ),
            ),
            Positioned(
              top: -4,
              right: -4,
              child: Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
