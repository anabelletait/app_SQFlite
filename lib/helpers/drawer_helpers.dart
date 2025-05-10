import 'package:app/screens/homepage_screen.dart';
import 'package:app/screens/user_screen.dart';
import 'package:app/screens/user_management_screen.dart';
import 'package:flutter/material.dart';

class DrawerHelpers extends StatefulWidget {
  const DrawerHelpers({super.key});

  @override
  State<DrawerHelpers> createState() => _DrawerHelpersState();
}

class _DrawerHelpersState extends State<DrawerHelpers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.purple[100],
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple[100],
            ),
            accountName: Text('Anabelle Tait', style: TextStyle(color: Colors.deepPurple[900], fontWeight: FontWeight.bold)), 
            accountEmail: Text('anabelletait@gmail.com', style: TextStyle(color: Colors.deepPurple[900])),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.deepPurple[900],
              child: Text('A', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.deepPurple[900]),
            title: Text('Página Inicial', style: TextStyle(color: Colors.deepPurple[900])),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomepageScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.deepPurple[900]),
            title: Text('Usuários', style: TextStyle(color: Colors.deepPurple[900])),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.deepPurple[900]),
            title: Text('Configurações', style: TextStyle(color: Colors.deepPurple[900])),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserManagementScreen()));
            },
          ),
        ],
      ),
    );
  }
}