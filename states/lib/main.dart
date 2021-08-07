//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MeuContadorDeCliques(),
    );
  }
}

class MeuContadorDeCliques extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MeuContadorDeCliquesState();
}

class _MeuContadorDeCliquesState extends State<MeuContadorDeCliques> {
  int contadorDeCliques;

  @override
  void initState() {
    contadorDeCliques = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Você clicou no botão x vezes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 8),
              Text('$contadorDeCliques',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contadorDeCliques = 0;
                    });
                  },
                  child: Text('ZERAR CONTADOR'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              contadorDeCliques++;
            });
          },
          child: Icon(Icons.add),
        ));
  }
}



/*
class Info extends StatefulWidget {
  Info(this.texto);

  final String texto;

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String texto;

  @override
  void initState() {
    texto = widget.texto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(texto),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            texto = 'Texto alternativo';
          });
        },
        child: Icon(
          Icons.track_changes,
        ),
      ),
    );
  }
}*/
