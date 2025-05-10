import 'dart:ffi';

import 'package:app/helpers/database_helper.dart';
import 'package:app/src/users.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

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

  void _addUser() async{
    final newUser = User(
      nome: _nameController.text,
      contato: _contactController.text, 
    );

    final dbHelper = DatabaseHelper.instance;
    await dbHelper.insertUser(newUser);

    _loadUsers();

    _nameController.clear();
    _contactController.clear();
    
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários')),
      body: Container(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            return Card(
              color: Colors.purple[100],
              child: ListTile(
                leading: Image(image: AssetImage('assets/img/pessoa-de-contato.png')),
                title: Text(user.nome, style: TextStyle(color: Colors.deepPurple[900], fontWeight: FontWeight.bold)),
                subtitle: Text('Contato: ${user.contato}', style: TextStyle(color: Colors.deepPurple[900])),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                title: Text('Adicionar novo usuário'),
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
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: Text('Cancelar')),
                  TextButton(
                    onPressed: (){
                      _addUser();
                    }, 
                    child: Text('Adicionar')),  
                ],
              );
            });
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.deepPurple[900],
      ),
    );
  }
}
