import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: const Color.fromARGB(255, 34, 33, 33), // Defina a cor de fundo da AppBar como cinza
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter, // Alinha a imagem para o topo
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/perfil.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nome: João Schneider', 
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'E-mail: joao.@gmail.com', 
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Telefone: (47) 4002-8922', 
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
