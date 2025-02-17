class Address {
  late String nome;
  late String estado;
  late String id;

  Address({
    required this.nome,
    required this.estado,
    required this.id,

  });

  Address.fromJson(Map<String, dynamic> json) {
    nome = json['nome'] ?? '';
    estado = json['estado'] ?? '';
    id = json['id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['estado'] = this.estado;
    data['id'] = this.id;

    return data;
  }
}
