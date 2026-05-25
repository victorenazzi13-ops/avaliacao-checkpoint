import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardWidget extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final VoidCallback? onTap;

  const ProductCardWidget({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.white,
              child: SizedBox(
                width: 180,
                height: 159,
                child: Image.asset(
                  image,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: GoogleFonts.orbitron().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'R\$ $price',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}