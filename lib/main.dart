import 'package:flutter/material.dart';
import 'perfil.dart';
import 'hist.dart'; // Importe o arquivo hist.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 24, 20, 20),
        primaryColor: Colors.black,
        hintColor: Colors.black,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
      ),
      home: const MyHomePage(title: 'Contador'),
      routes: {
        '/perfil': (context) => PerfilPage(),
        '/historico': (context) => HistoryPage(), // Adicione a rota para a página de histórico
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _incrementing = false;
  bool _decrementing = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _startIncrementing() {
    _incrementing = true;
    _incrementContinuously();
  }

  void _stopIncrementing() {
    _incrementing = false;
  }

  void _startDecrementing() {
    _decrementing = true;
    _decrementContinuously();
  }

  void _stopDecrementing() {
    _decrementing = false;
  }

  void _incrementContinuously() {
    if (_incrementing) {
      _incrementCounter();
      Future.delayed(Duration(milliseconds: 200), _incrementContinuously);
    }
  }

  void _decrementContinuously() {
    if (_decrementing) {
      _decrementCounter();
      Future.delayed(Duration(milliseconds: 200), _decrementContinuously);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 24, 20, 20),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Número:',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '$_counter',
              style: TextStyle(color: Colors.white, fontSize: 48),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onLongPress: _startDecrementing,
                  onLongPressUp: _stopDecrementing,
                  child: ElevatedButton(
                    onPressed: _decrementCounter,
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 82, 80, 80),
                    ),
                    child: Text('-', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _resetCounter,
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 82, 80, 80),
                  ),
                  child: Text('C', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onLongPress: _startIncrementing,
                  onLongPressUp: _stopIncrementing,
                  child: ElevatedButton(
                    onPressed: _incrementCounter,
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 82, 80, 80),
                    ),
                    child: Text('+', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 24, 20, 20),
              ),
              child: Text(
                'Bem vindo',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Perfil', style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0))),
              onTap: () {
                Navigator.pushNamed(context, '/perfil');
              },
            ),
            ListTile(
              title: Text('Histórico', style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0))),
              onTap: () {
                Navigator.pushNamed(context, '/historico'); // Navegue para a página de histórico (hist.dart)
              },
            ),
          ],
        ),
      ),
    );
  }
}
