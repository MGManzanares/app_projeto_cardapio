class MenuItem {
  final String name;
  final String imagem;
  final double price;
  final String description;
  final bool ativo;
  final String categoria;
  int quantidade;

  // Construtor nomeado
  MenuItem({
    required this.name,
    required this.imagem,
    required this.price,
    required this.description,
    required this.ativo,
    required this.categoria,
    this.quantidade = 1,
  });

  // Função para converter de Map para MenuItem
  factory MenuItem.fromMap(Map<String, dynamic> data) {
    return MenuItem(
      name: data['nome'] ?? 'Nome não disponível',
      imagem: data['imagem'] ?? '',
      price: (data['preço'] is num ? data['preço'].toDouble() : 0.0),
      description: data['descrição'] ?? 'Descrição não disponível',
      ativo: data['ativo'] ?? true,
      categoria: data['categoria'] ?? 'Categoria não disponível',
    );
  }

  // Função toJson para enviar para o Firestore
  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'imagem': imagem,
      'preço': price,
      'descrição': description,
      'ativo': ativo,
      'categoria': categoria,
    };
  }
}
