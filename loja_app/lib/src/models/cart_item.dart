import 'produto.dart';

class CartItem {
  final Produto produto;
  int quantidade;

  CartItem({
    required this.produto,
    this.quantidade = 1,
  });
}