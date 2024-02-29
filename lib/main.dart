import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_28_1_24/registro.dart';
import 'package:practica_28_1_24/calcu_sueldo.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MiPantalla(),
    ),
  );
}

class MiPantalla extends StatelessWidget {
  const MiPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.network(
                'https://seeklogo.com/images/F/Fe_y_Alegria-logo-BF8EDA2F0E-seeklogo.com.png',
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Registro'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistroScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Calcular sueldo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DosPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Salir'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                'https://th.bing.com/th/id/OIP.gydLDlo8jgOkXADoh9mIEwAAAA?w=295&h=62&rs=1&pid=ImgDetMain'),
            const SizedBox(height: 50),
            const Text(
              'Bienvenido',
              style: TextStyle(
                fontWeight: FontWeight.bold, // Hace el texto en negrita
                color: Color.fromARGB(
                    255, 9, 49, 70), // Cambia el color del texto a azul oscuro
                fontSize: 24, // Opcional: Ajusta el tamaño del texto
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text('Salir'),
            ),
          ],
        ),
      ),
    );
  }
}
