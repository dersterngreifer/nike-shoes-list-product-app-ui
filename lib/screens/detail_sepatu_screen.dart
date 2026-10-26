import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShoeDetailScreen extends StatefulWidget {
  final String shoeName;
  final String shoeImage;
  final int price;
  final double rating;
  final Color cardColor;

  const ShoeDetailScreen({
    super.key,
    required this.shoeName,
    required this.shoeImage,
    required this.price,
    required this.rating,
    this.cardColor = const Color(0xFFF4F4F4),
  });

  factory ShoeDetailScreen.legacy({
    Key? key,
    required String sepatu,
    required String fotospt,
    required int harga,
    required double rating,
    Color cardColor = const Color(0xFFF4F4F4),
  }) {
    return ShoeDetailScreen(
      key: key,
      shoeName: sepatu,
      shoeImage: fotospt,
      price: harga,
      rating: rating,
      cardColor: cardColor,
    );
  }

  @override
  State<ShoeDetailScreen> createState() => _ShoeDetailScreenState();
}

typedef DetailSepatu = ShoeDetailScreen;

class _ShoeDetailScreenState extends State<ShoeDetailScreen> {
  final List<int> sizes = [38, 39, 40, 41, 42, 43, 44];
  final Set<int> _soldOutSizes = {38, 44}; // contoh size habis
  int _selectedSize = 2;
  int _quantity = 1;
  bool _isWishlisted = false;

  bool get _isSelectedSoldOut => _soldOutSizes.contains(sizes[_selectedSize]);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currency = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 0,
    );
    // contoh harga coret / diskon 20%
    final originalPrice = (widget.price / 0.8).round();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ================= IMAGE HEADER =================
            SliverAppBar(
              expandedHeight: size.height * 0.30,
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
                      color: Colors.white.withValues(alpha: 0.85),
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
                    onTap: () => setState(() => _isWishlisted = !_isWishlisted),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black.withValues(alpha: 0.06),
                        ),
                      ),
                      child: Icon(
                        _isWishlisted
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        color: _isWishlisted ? Colors.red : Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 60),
                      color: widget.cardColor,
                      child: Hero(
                        tag: widget.shoeName,
                        child: OverflowBox(
                          maxWidth: double.infinity,
                          maxHeight: double.infinity,
                          child: Transform.scale(
                            scale: 0.3,
                            child: Image.asset(
                              widget.shoeImage,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Badge "Best Seller"
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 60,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'BEST SELLER',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ================= PRODUCT INFO =================
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 120),
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
                                '  (2.4k reviews)',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
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
                        'Nike ${widget.shoeName}',
                        style: GoogleFonts.poppins(
                          fontSize: size.width * 0.072,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          height: 1.15,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // Colorway
                      Text(
                        'Black / White / Volt',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Price row + discount badge
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            currency.format(widget.price),
                            style: GoogleFonts.poppins(
                              fontSize: size.width * 0.062,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            currency.format(originalPrice),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '-20%',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'or 3x ${currency.format((widget.price / 3).round())} with installments',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black45,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // ---------- SIZE SELECTOR ----------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Size',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'EU',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        height: 56,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: sizes.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final selected = _selectedSize == index;
                            final soldOut = _soldOutSizes.contains(
                              sizes[index],
                            );
                            return GestureDetector(
                              onTap: soldOut
                                  ? null
                                  : () => setState(() => _selectedSize = index),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                width: 56,
                                height: 56,
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
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      sizes[index].toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: soldOut
                                            ? Colors.black26
                                            : selected
                                            ? Colors.white
                                            : Colors.black87,
                                        decoration: soldOut
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    ),
                                    if (soldOut)
                                      Positioned(
                                        bottom: 6,
                                        child: Container(
                                          width: 24,
                                          height: 1.5,
                                          color: Colors.black26,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 28),

                      // ---------- QUANTITY ----------
                      Text(
                        'Quantity',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _qtyButton(
                            icon: Icons.remove_rounded,
                            onTap: _quantity > 1
                                ? () => setState(() => _quantity--)
                                : null,
                          ),
                          Container(
                            width: 56,
                            height: 48,
                            alignment: Alignment.center,
                            child: Text(
                              '$_quantity',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _qtyButton(
                            icon: Icons.add_rounded,
                            onTap: _quantity < 10
                                ? () => setState(() => _quantity++)
                                : null,
                          ),
                          const Spacer(),
                          Text(
                            'Max 10',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      // ---------- KEY FEATURES ----------
                      Text(
                        'Key Features',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          _FeatureChip(label: 'Breathable Mesh'),
                          _FeatureChip(label: 'Air Cushioning'),
                          _FeatureChip(label: 'Rubber Outsole'),
                          _FeatureChip(label: 'Lightweight'),
                          _FeatureChip(label: 'Recycled Materials'),
                        ],
                      ),

                      const SizedBox(height: 28),

                      // ---------- DESCRIPTION ----------
                      Text(
                        'Description',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Engineered for maximum performance and everyday comfort. '
                        'Premium materials paired with advanced technology deliver optimal '
                        'support for every stride. The innovative sole efficiently absorbs '
                        'impact, while the ergonomic design keeps your feet comfortable '
                        'all day long. Perfect for a wide range of activities from light training '
                        'to daily urban adventures.',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.7,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // ---------- SPECS ----------
                      Text(
                        'Specifications',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const _SpecRow(
                        label: 'Material',
                        value: 'Knit Mesh / Synthetic',
                      ),
                      const _SpecRow(
                        label: 'Cushioning',
                        value: 'Nike Air Zoom',
                      ),
                      const _SpecRow(
                        label: 'Weight',
                        value: '~280 g (size 42)',
                      ),
                      const _SpecRow(label: 'Heel Drop', value: '10 mm'),
                      const _SpecRow(label: 'Closure', value: 'Lace-up'),
                      const _SpecRow(label: 'SKU', value: 'NIK-DR-2025-042'),

                      const SizedBox(height: 28),

                      // ---------- SHIPPING ----------
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F7F7),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            _infoRow(
                              Icons.local_shipping_outlined,
                              'Free shipping',
                              'Estimated delivery 2–4 days',
                            ),
                            const SizedBox(height: 12),
                            _infoRow(
                              Icons.autorenew_rounded,
                              'Free returns',
                              'Within 30 days of purchase',
                            ),
                            const SizedBox(height: 12),
                            _infoRow(
                              Icons.verified_outlined,
                              'Authenticity guaranteed',
                              '100% original Nike product',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        // ================= STICKY BOTTOM BAR =================
        bottomNavigationBar: Container(
          padding: EdgeInsets.fromLTRB(
            24,
            14,
            24,
            MediaQuery.of(context).padding.bottom + 14,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.black.withValues(alpha: 0.06)),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Price block
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    currency.format(widget.price * _quantity),
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Add to Bag
              Expanded(
                child: SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _isSelectedSoldOut ? null : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.black26,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _isSelectedSoldOut
                              ? Icons.block_rounded
                              : Icons.shopping_bag_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isSelectedSoldOut ? 'Sold Out' : 'Add to Bag',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _qtyButton({required IconData icon, VoidCallback? onTap}) {
    final disabled = onTap == null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: disabled ? const Color(0xFFF7F7F7) : const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Icon(
          icon,
          size: 20,
          color: disabled ? Colors.black26 : Colors.black87,
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: Colors.black87),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 11.5,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ================= SMALL WIDGETS =================
class _FeatureChip extends StatelessWidget {
  final String label;
  const _FeatureChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_rounded, size: 14, color: Colors.black87),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecRow extends StatelessWidget {
  final String label;
  final String value;
  const _SpecRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
