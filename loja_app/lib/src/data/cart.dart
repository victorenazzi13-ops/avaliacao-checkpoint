import '../models/produto.dart';
import '../models/cart_item.dart';

final List<CartItem> carrinho = [];

void adicionarAoCarrinho(Produto produto) {
  final index = carrinho.indexWhere(
    (item) => item.produto.name == produto.name,
  );

  if (index >= 0) {
    carrinho[index].quantidade++;
  } else {
    carrinho.add(CartItem(produto: produto));
  }
}

void removerDoCarrinho(int index) {
  carrinho.removeAt(index);
}

void aumentarQuantidade(int index) {
  carrinho[index].quantidade++;
}

void diminuirQuantidade(int index) {
  if (carrinho[index].quantidade > 1) {
    carrinho[index].quantidade--;
  } else {
    carrinho.removeAt(index);
  }
}

double calcularTotal() {
  return carrinho.fold(0, (soma, item) {
    final preco = double.parse(item.produto.price.replaceAll(',', '.'));
    return soma + (preco * item.quantidade);
  });
}

void limparCarrinho() {
  carrinho.clear();
}