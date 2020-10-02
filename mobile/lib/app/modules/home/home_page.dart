import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
        backgroundColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Criar perfil'),
                onPressed: () {
                  // Navigate to  using a named route.
                  Modular.to.pushNamed('perfil/create');
                },
              )
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Publicar'),
                onPressed: () {
                  // Navigate to  using a named route.
                  Modular.to.pushNamed('/publishMedia');
                },
              )
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Nova oportunidade'),
                onPressed: () {
                  // Navigate to  using a named route.
                  Modular.to.pushNamed('/NewOpportunity');
                },
              )
            ],
          ),
        ],
      )),
    );
  }
}
