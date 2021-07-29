import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ListaContatos(
        contatos: [
          'Cairo',
          'Roberta',
          'Almeida',
          'Roberval',
          'Jacir',
          'Montgomery',
        ],
      ),
    );
  }
}

class ListaContatos extends StatelessWidget {
  ListaContatos({this.contatos});

  final List<String> contatos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de contatos'),
          leading: Icon(Icons.contact_phone),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) =>
              LinhaContato(contato: contatos[index]),
          itemCount: contatos.length,
        ));
  }
}

class LinhaContato extends StatelessWidget {
  const LinhaContato({this.contato});

  final String contato;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person_outline),
      title: Text(contato),
      trailing: Container(
        width: 60,
        child: Row(
          children: [
            Icon(Icons.edit),
            SizedBox(
              width: 6,
            ),
            Icon(Icons.delete),
          ],
        ),
      ),
    );
  }
}
