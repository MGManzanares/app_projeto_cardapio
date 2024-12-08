import 'package:app_projeto_cardapio/model/carrinho.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Função para buscar o nome do usuário no Firestore
Future<String> buscarNomeUsuario(String uid) async {
  try {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Busca o usuário no Firestore pela UID
    final resultado = await firestore
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .limit(1)
        .get();

    if (resultado.docs.isNotEmpty) {
      return resultado.docs.first.data()['nome'] ?? 'Usuário desconhecido';
    }

    return 'Usuário desconhecido';
  } catch (e) {
    print("Erro ao buscar o nome do usuário: $e");
    return 'Usuário desconhecido';
  }
}

/// Função para criar pedido no Firestore
Future<void> criarPedido({
  required String uid,
  required List<ItemCarrinho> itens,
}) async {
  try {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Busca o nome do usuário pelo UID
    final String nomeUsuario = await buscarNomeUsuario(uid);

    // Formatação da data e hora do pedido
    final String dataHora = DateTime.now().toString();

    // Estrutura do pedido com os dados necessários
    final pedido = {
      'uid': uid,
      'nome_usuario': nomeUsuario, // Adicionando o nome do usuário
      'status': 'Preparando',
      'data_hora': dataHora,
      'itens': itens.map((item) {
        return {
          'item_id': item.itemId,
          'preco': item.preco,
          'quantidade': item.quantidade,
        };
      }).toList(),
    };

    // Salvar no Firestore na coleção 'Pedidos'
    await firestore.collection('Pedidos').add(pedido);

    print("Pedido salvo com sucesso!");
  } catch (e) {
    print("Erro ao salvar pedido: $e");
  }
}
