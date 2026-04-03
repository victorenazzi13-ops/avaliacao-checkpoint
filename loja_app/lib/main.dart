import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, String>> produtos = [
    {
      "nome": "Camisa",
      "preco": "R\$ 50",
      "imagem": "https://via.placeholder.com/150"
    },
    {
      "nome": "Tênis",
      "preco": "R\$ 200",
      "imagem": "https://via.placeholder.com/150"
    },
    {
      "nome": "Boné",
      "preco": "R\$ 30",
      "imagem": "https://via.placeholder.com/150"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Minha Loja")),
        body: ListView(
          children: produtos.map((produto) {
            return Card(
              child: ListTile(
                leading: Image.network(produto["imagem"]!),
                title: Text(produto["nome"]!),
                subtitle: Text(produto["preco"]!),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}