import 'package:flutter/material.dart';
import 'package:holbegram/models/post.dart'; // Asegúrate de que este import sea correcto.

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset( // Añade const aquí si todos los parámetros son constantes
              'assets/logo.png',
              fit: BoxFit.cover,
              height: 30,
            ),
            const Text( 
              'Holbegram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 32,
              ),
            ),
          ],
        ),
        actions: const <Widget>[ // Añade const aquí
          IconButton(
            icon: Icon(Icons.search), // Primer ícono
            onPressed: null, // Añade una función o deja null si no es necesario
          ),
          IconButton(
            icon: Icon(Icons.notifications), // Segundo ícono
            onPressed: null, // Añade una función o deja null si no es necesario
          ),
        ],
      ),
      body: const Posts(),
    );
  }
}
