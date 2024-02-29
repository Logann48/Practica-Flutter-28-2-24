import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_28_1_24/registro.dart';
import 'main.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MiPantalla(),
    ),
  );
}

@override
Widget build(BuildContext context) {
 return Scaffold(
    appBar: AppBar(
      title: const Text('Calcular Sueldo'),
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
                MaterialPageRoute(builder: (context) => const RegistroScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Calcular sueldo'),
            onTap: () {
              // Aquí puedes manejar la acción de navegar a la misma pantalla
              // o simplemente cerrar el drawer si es necesario
              Navigator.pop(context);
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
    body: const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          // El contenido de tu pantalla va aquí
        ],
      ),
    ),
 );
}

class DosPage extends StatefulWidget {
  const DosPage({super.key});

  @override
  DosPageState createState() => DosPageState();
}

class DosPageState extends State<DosPage> {
  final cedulaController = TextEditingController();
  final nombreController = TextEditingController();
  final sueldoBaseController = TextEditingController();
  final comisionController = TextEditingController();
  final deduccionController = TextEditingController();
  final resultadoController = TextEditingController();

  void calcular() {
    double sueldoNeto = double.parse(sueldoBaseController.text) +
        double.parse(comisionController.text) -
        double.parse(deduccionController.text);
    resultadoController.text = sueldoNeto.toStringAsFixed(2);
  }

  void limpiar() {
    cedulaController.clear();
    nombreController.clear();
    sueldoBaseController.clear();
    comisionController.clear();
    deduccionController.clear();
    resultadoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: SizedBox(
          height: 100,
          child: Image.network(
            'https://th.bing.com/th/id/OIP.L3f1yjDrBTaF0wb2Ov1jLQHaCS?w=504&h=156&rs=1&pid=ImgDetMain',
          ),
        ),
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            TextField(
                controller: cedulaController,
                decoration: const InputDecoration(labelText: 'Cédula')),
            TextField(
                controller: nombreController,
                decoration: const InputDecoration(labelText: 'Nombre')),
            TextField(
                controller: sueldoBaseController,
                decoration: const InputDecoration(labelText: 'Sueldo Base')),
            TextField(
                controller: comisionController,
                decoration: const InputDecoration(labelText: 'Comisión')),
            TextField(
                controller: deduccionController,
                decoration: const InputDecoration(labelText: 'Deducción')),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: calcular, child: const Text('Calcular')),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: limpiar, child: const Text('Limpiar')),
              ],
            ),
            const SizedBox(width: 50),
            TextField(
                controller: resultadoController,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Resultado')),
            const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}


