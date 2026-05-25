import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/produto.dart';
import '../data/cart.dart';

class DetailScreen extends StatelessWidget {
  final Produto produto;

  const DetailScreen({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          produto.name,
          style: TextStyle(
            fontFamily: GoogleFonts.orbitron().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 260,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.white,
              child: Image.asset(
                produto.image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              produto.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: GoogleFonts.orbitron().fontFamily,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'R\$ ${produto.price}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7800F7),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              produto.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  adicionarAoCarrinho(produto);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${produto.name} adicionado ao carrinho!'),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined),
                label: const Text('Adicionar ao carrinho'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7800F7),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}