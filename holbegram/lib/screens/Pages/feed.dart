import 'package:flutter/material.dart';
// Asume que Posts es importado o definido en otro lugar

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Asegúrate de tener un asset de imagen del logo
              fit: BoxFit.cover,
              height: 30, // Ajusta según el tamaño de tu logo
            ),
            Text(
              'Holbegram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 32,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), // Primer ícono
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications), // Segundo ícono
            onPressed: () {},
          ),
        ],
      ),
      body: Posts(), // Widget Posts que definirás posteriormente
    );
  }
}
