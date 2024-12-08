// ignore_for_file: unnecessary_import, prefer_const_constructors


import '../model/cardapio.dart';

class Cart {
  List<MenuItem> items = [];

  // Adiciona um item no carrinho
  void addItem(MenuItem item) {
    final index = items.indexWhere((cartItem) => cartItem.name == item.name);
    if (index >= 0) {
      // Se já existir, incrementa a quantidade
      items[index].quantidade += 1;
    } else {
      // Caso contrário, adiciona o item com quantidade padrão
      items.add(MenuItem(
        name: item.name,
        description: item.description,
        price: item.price,
        imagem: item.imagem,
        ativo: item.ativo,
        categoria: item.categoria,
        quantidade: 1,
      ));
    }
  }

  // Remove um item do carrinho ou decrementa a quantidade se maior que 1
  void removeItem(MenuItem item) {
    final index = items.indexWhere((cartItem) => cartItem.name == item.name);
    if (index >= 0) {
      if (items[index].quantidade > 1) {
        items[index].quantidade -= 1; // Decrementa quantidade
      } else {
        items.removeAt(index); // Remove o item se quantidade for 1
      }
    }
  }

  void clear() {
    items.clear();
  }

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + (item.price * item.quantidade));

  bool get isEmpty => items.isEmpty;

  bool get hasItems => items.isNotEmpty;
}
