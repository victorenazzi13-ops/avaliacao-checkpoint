import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get total {
    return carrinho.fold(0, (soma, produto) {
      final preco = double.parse(produto.price.replaceAll(',', '.'));
      return soma + preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrinho',
          style: TextStyle(
            fontFamily: GoogleFonts.orbitron().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: carrinho.isEmpty
          ? const Center(
              child: Text(
                'Seu carrinho está vazio.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: carrinho.length,
                    itemBuilder: (context, index) {
                      final produto = carrinho[index];

                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: Image.asset(
                            produto.image,
                            width: 50,
                            fit: BoxFit.contain,
                          ),
                          title: Text(produto.name),
                          subtitle: Text('R\$ ${produto.price}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () {
                              setState(() {
                                carrinho.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Total: R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Compra finalizada com sucesso!'),
                              ),
                            );

                            setState(() {
                              carrinho.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7800F7),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Finalizar compra'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}