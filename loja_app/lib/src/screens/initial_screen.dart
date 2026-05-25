import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/hero_section_widget.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/categories_section_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/footer_widget.dart';

import 'detail_screen.dart';
import 'cart_screen.dart';
import 'login_screen.dart';

import '../data/produtos.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, size: 40),
        title: Image.asset('assets/logo_usedev.png', height: 40),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, size: 40),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, size: 40),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'O que você procura?',
                  suffixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const HeroSection(),
            const SizedBox(height: 20),

            const CategoriesSection(),
            const SizedBox(height: 20),

            Text(
              'Promos Especiais',
              style: TextStyle(
                fontFamily: GoogleFonts.orbitron().fontFamily,
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            ...produtos.map(
              (produto) => ProductCardWidget(
                name: produto.name,
                price: produto.price,
                image: produto.image,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(produto: produto),
                    ),
                  );
                },
              ),
            ),

            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Ver mais',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: const Color(0xFF7800F7),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const BannerWidget(),

            const SizedBox(height: 20),

            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}