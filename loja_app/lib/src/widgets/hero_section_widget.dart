import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/herogrid.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset('assets/Banner.png'),
          ),

          Text.rich(
            const TextSpan(
              text: 'Hora de abraçar seu ',
              style: TextStyle(color: Color(0xFFFF55DF)),
              children: [
                TextSpan(
                  text: 'lado geek',
                  style: TextStyle(color: Color(0xFF8FFF24)),
                ),
              ],
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: GoogleFonts.orbitron().fontFamily,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7800F7),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            ),
            child: Text(
              'Ver as novidades!',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
