class Categorias {
  final String nome;
  final String descricao;
  final int ordem;

  Categorias(this.nome, this.descricao, this.ordem);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
      'ordem': ordem
    };
  }

  factory Categorias.fromJson(Map<String, dynamic> json) {
    return Categorias(
      json['nome'],
      json['descricao'],
      json['ordem'],
    );
  }
}