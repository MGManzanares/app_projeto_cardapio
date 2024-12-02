import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_projeto_cardapio/model/cardapio.dart';
import 'package:app_projeto_cardapio/model/categorias.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> inicializarDados() async {
    try {
      await inicializarCategorias();
      await inicializarItensCardapio();
    } catch (e) {
      print('Erro ao inicializar dados: $e');
    }
  }

  Future<void> inicializarCategorias() async {
    final categoriasRef = _firestore.collection('categorias');
    final categorias = [
      Categorias('Lanches', 'Categoria de lanches', 1),
      Categorias('Acompanhamentos', 'Categoria de acompanhamentos', 2),
      Categorias('Bebidas', 'Categoria de bebidas', 3)
      // ... adicionar mais categorias aqui
    ];

    for (var categoria in categorias) {
      try {
        await categoriasRef.add(categoria.toJson());
      } catch (e) {
        print('Erro ao adicionar categoria ${categoria.nome}: $e');
      }
    }
  }

  Future<void> inicializarItensCardapio() async {
    final itensRef = _firestore.collection('itens_cardapios');
    final itens = [
      MenuItem(
        name: 'Montanha',
        imagem: 'lib/images/montanha.jpg',
        price: 45.00,
        description: 'Um lanche generoso, 400g de carne bovina, queijo e acompanhamentos frescos, formando uma "montanha" de sabores.',
        ativo: true,
        categoria: 'Lanches',
      ),
      
      MenuItem(
        name: 'Batata Frita',
        imagem: 'lib/images/batata.jpg',
        price: 15.00,
        description: 'Batatas fritas crocantes e deliciosas.',
        ativo: true,
        categoria: 'Acompanhamentos',
      ),
      
      MenuItem(
        name: 'Trem da Felicidade',
        imagem: 'lib/images/trem.jpg',
        price: 100.00,
        description: 'Um combo completo com uma seleção de 3 lanches saborosos, garantindo uma viagem deliciosa de sabores e alegria.',
        ativo: true,
        categoria: 'Lanches',
      ),
      
      MenuItem(
        name: 'Tradicional',
        imagem: 'lib/images/tradicional.jpg',
        price: 25.00,
        description: 'Um lanche clássico, simples e delicioso, com carne grelhada, queijo derretido e ingredientes frescos.',
        ativo: true,
        categoria: 'Lanches',
      ),

      MenuItem(
        name: 'Baconlicioso',
        imagem: 'lib/images/bacon.jpg',
        price: 35.00,
        description: 'Um lanche irresistível com camadas generosas de bacon crocante, queijo derretido e molhos especiais.',
        ativo: true,
        categoria: 'Lanches',
      ),

      MenuItem(
        name: 'Amigão',
        imagem: 'lib/images/amigao.jpg',
        price: 35.00,
        description: 'Um lanche amigável e acolhedor, repleto de carne suculenta, queijo, bacon e alface.',
        ativo: true,
        categoria: 'Lanches',
      ),

      MenuItem(
        name: 'Onion Rings',
        imagem: 'lib/images/onion.jpg',
        price: 12.00,
        description: 'Anéis de cebola empanados e fritos.',
        ativo: true,
        categoria: 'Acompanhamentos',
      ),

      MenuItem(
        name: 'Refrigerante',
        imagem: 'lib/images/refri.jpg',
        price: 5.00,
        description: 'Refrigerante gelado, perfeito para acompanhar seu lanche',
        ativo: true,
        categoria: 'Bebidas',
      ),

      MenuItem(
        name: 'Suco Natural',
        imagem: 'lib/images/suco.jpg',
        price: 7.00,
        description: 'Suco natural feito com frutas frescas.',
        ativo: true,
        categoria: 'Bebidas',
      ),
    ];

    for (var item in itens) {
      try {
        await itensRef.add(item.toJson());
      } catch (e) {
        print('Erro ao adicionar item ${item.name}: $e');
      }
    }
  }
}