class User {
  final int? id;
  final String nome;
  final String contato;
  
  User({this.id, required this.contato, required this.nome});
  
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': nome,
      'phone': contato,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nome: map['name'],
      contato: map['phone'],
    );
  }
}