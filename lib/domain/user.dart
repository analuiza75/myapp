class User {
  late String username;
  late String password;
  late String? nome = "";
  late String? email = "";
  late String? curso = "";

  // Construtor atualizado
  User({
    required this.username,
    required this.password,
    this.nome,
    this.email,
    this.curso,
  });

  // Método para converter para JSON (usado ao inserir no banco de dados)
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'nome': nome,
      'email': email,
      'curso': curso,
    };
  }

  // Método para criar um objeto User a partir de um Map (usado ao buscar no banco de dados)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      nome: json['nome'],
      email: json['email'],
      curso: json['curso'],
    );
  }
}
