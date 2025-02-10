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
    cep = json['nome'] ?? '';
    state = json['estado'] ?? '';
    city = json['id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.cep;
    data['estado'] = this.state;
    data['id'] = this.city;

    return data;
  }
}




{
"nome": "São Benedito",
"estado": "CE",
"id": 4750
}
]