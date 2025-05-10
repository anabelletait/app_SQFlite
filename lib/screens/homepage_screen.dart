import 'package:app/helpers/drawer_helpers.dart';
import 'package:app/screens/user_screen.dart';
import 'package:app/screens/user_management_screen.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final List<String> images = ['assets/img/pessoa-de-contato.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Página Inicial')),
      drawer: DrawerHelpers(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.0,
        ),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                color: Colors.purple[100],
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset('assets/img/pessoa-de-contato.png'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Usuários',
                        style: TextStyle(color: Colors.deepPurple[900], fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserManagementScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                color: Colors.purple[100],
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset('assets/img/parental-control.png'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Configurações',
                        style: TextStyle(color: Colors.deepPurple[900], fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

