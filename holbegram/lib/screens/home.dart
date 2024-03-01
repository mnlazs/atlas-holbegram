import 'package:flutter/material.dart';

// Define el widget Home con un parámetro key
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Usar Scaffold y BottomNav como bottomNavigationBar
    return const Scaffold(
      bottomNavigationBar: BottomNav(),
    );
  }
}

// Definición del widget BottomNav
class BottomNav extends StatelessWidget {
  const BottomNav({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
        // Añade más ítems según tu necesidad
      ],
      // Configura otros parámetros según necesites
    );
  }
}
