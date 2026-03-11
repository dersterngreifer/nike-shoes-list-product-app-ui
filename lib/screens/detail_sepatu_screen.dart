import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailSepatu extends StatefulWidget {
  final String sepatu, fotospt;
  final int harga;
  final double rating;
  final Color cardColor;

  const DetailSepatu({
    super.key,
    required this.sepatu,
    required this.fotospt,
    required this.harga,
    required this.rating,
    this.cardColor = const Color(0xFFF4F4F4),
  });

  @override
  State<DetailSepatu> createState() => _DetailSepatuState();
}

class _DetailSepatuState extends State<DetailSepatu> {
  final List<int> ukuran = [38, 39, 40, 41, 42, 43, 44];
  int _selectedSize = 2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Expandable image header
            SliverAppBar(
              expandedHeight: size.height * 0.42,
              floating: false,
              pinned: true,
              backgroundColor: widget.cardColor,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.75),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.06),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.75),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black.withValues(alpha: 0.06),
                        ),
                      ),
                      child: const Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: widget.cardColor,
                  child: Hero(
                    tag: widget.sepatu,
                    child: Image.asset(widget.fotospt, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),

            // Product info sheet
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Drag handle
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 24),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),

                      // Brand + rating row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'NIKE COLLECTION',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.black45,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                                size: 22,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                widget.rating.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                ' / 5',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      // Product name
                      Text(
                        'Nike ${widget.sepatu}',
                        style: GoogleFonts.poppins(
                          fontSize: size.width * 0.072,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          height: 1.15,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // Price
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(widget.harga),
                        style: GoogleFonts.poppins(
                          fontSize: size.width * 0.052,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Size selector
                      Text(
                        'Pilih Ukuran',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        height: 52,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: ukuran.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final selected = _selectedSize == index;
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedSize = index),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: selected
                                      ? Colors.black
                                      : const Color(0xFFF4F4F4),
                                  borderRadius: BorderRadius.circular(14),
                                  border: selected
                                      ? null
                                      : Border.all(
                                          color: Colors.black12,
                                          width: 1,
                                        ),
                                ),
                                child: Center(
                                  child: Text(
                                    ukuran[index].toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: selected
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Description
                      Text(
                        'Deskripsi',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Dirancang untuk performa maksimal dan kenyamanan sehari-hari. '
                        'Material premium dengan teknologi terkini memberikan dukungan '
                        'optimal untuk setiap langkah. Sol inovatif menyerap benturan '
                        'secara efisien, sementara desain ergonomis memastikan kaki '
                        'tetap nyaman sepanjang hari. Cocok untuk berbagai aktivitas '
                        'mulai dari olahraga ringan hingga petualangan sehari-hari.',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.7,
                        ),
                      ),

                      const SizedBox(height: 36),

                      // Buy button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Pesan Sekarang',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
