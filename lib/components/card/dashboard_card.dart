import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nike_shoes_list_product_app/models/sandal.dart';
import 'package:nike_shoes_list_product_app/screens/detail_sepatu_screen.dart';

// Unique accent color for each card — complements the shoe color
const List<Color> _cardColors = [
  Color(0xFFD6F0D6), // Air Max — soft green
  Color(0xFFD6E8F8), // Air Force — sky blue
  Color(0xFFFFE8D6), // React Element — warm peach
  Color(0xFFEBD6F8), // Free Run — soft lavender
  Color(0xFFFDF2CC), // Epic React — warm yellow
];

// Darker shade used for category badge
const List<Color> _badgeColors = [
  Color(0xFFB2DFB2),
  Color(0xFFB2CCE8),
  Color(0xFFFFCCAA),
  Color(0xFFD4B2E8),
  Color(0xFFF5E098),
];

Widget dashboardCard(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final List<Shoe> shoes = Shoe.getShoes();
  final double cardHeight = size.width * 0.52;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      children: List.generate(shoes.length, (index) {
        final item = shoes[index];
        final cardColor = _cardColors[index % _cardColors.length];
        final badgeColor = _badgeColors[index % _badgeColors.length];

        return Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Card body
                Container(
                  width: double.infinity,
                  height: cardHeight,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: cardColor.withValues(alpha: 0.7),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top row: category badge + favorite icon
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: badgeColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'NIKE',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.favorite_outline_rounded,
                                  size: 18,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        // Product name
                        Text(
                          item.name,
                          style: GoogleFonts.poppins(
                            fontSize: size.width * 0.055,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Price
                        Text(
                          NumberFormat.currency(
                            locale: 'en_US',
                            symbol: '\$',
                            decimalDigits: 2,
                          ).format(item.price),
                          style: GoogleFonts.poppins(
                            fontSize: size.width * 0.036,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 14),

                        // View details button
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ShoeDetailScreen(
                                  shoeName: item.name,
                                  shoeImage: 'assets/${item.image}',
                                  price: item.price,
                                  rating: item.rating,
                                  cardColor: cardColor,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'View Details',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Shoe image — pops out top-right, overflow beyond card
                Positioned(
                  bottom: -18,
                  right: -24,
                  child: Hero(
                    tag: item.name,
                    child: Image.asset(
                      'assets/${item.image}',
                      width: size.width * 0.54,
                    ),
                  ),
                ),

                // Star rating chip — top right area
                Positioned(
                  top: 54,
                  right: size.width * 0.2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 14,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          item.rating.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (index < shoes.length - 1) const SizedBox(height: 28),
          ],
        );
      }),
    ),
  );
}
