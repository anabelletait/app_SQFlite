import 'package:flutter/material.dart';
import 'package:app/helpers/database_helper.dart';
import 'package:app/src/users.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  List<User> users = [];
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    final dbHelper = DatabaseHelper.instance;
    final userList = await dbHelper.getUser();
    setState(() {
      users = userList;
    });
  }

  void _deleteUser(User user) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar exclusão'),
          content: Text('Tem certeza que deseja excluir o contato ${user.nome}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                final dbHelper = DatabaseHelper.instance;
                await dbHelper.deleteUser(user.id!);
                _loadUsers();
                Navigator.pop(context);
              },
              child: Text('Excluir', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _editUser(User user) {
    _nameController.text = user.nome;
    _contactController.text = user.contato;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar usuário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 140,
                height: 140,
                child: Image(image: AssetImage('assets/img/pessoa-de-contato.png')),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _contactController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Contato'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                final updatedUser = User(
                  id: user.id,
                  nome: _nameController.text,
                  contato: _contactController.text,
                );

                final dbHelper = DatabaseHelper.instance;
                await dbHelper.updateUser(updatedUser);
                _loadUsers();
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Usuários'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            color: Colors.purple[100],
            child: ListTile(
              leading: CircleAvatar(
                child: Image(image: AssetImage('assets/img/pessoa-de-contato.png')),
              ),
              title: Text(user.nome, style: TextStyle(color: Colors.deepPurple[900], fontWeight: FontWeight.bold)),
              subtitle: Text('Contato: ${user.contato}', style: TextStyle(color: Colors.deepPurple[900])),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editUser(user),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteUser(user),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
} 