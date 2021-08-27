import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lista_de_leitura/models/livro_model.dart';

class FormularioLivroPage extends StatefulWidget {
  FormularioLivroPage({this.livro, @required this.onCadastrar});

  final LivroModel livro;
  final Function(LivroModel) onCadastrar;

  @override
  _FormularioLivroPageState createState() => _FormularioLivroPageState();
}

class _FormularioLivroPageState extends State<FormularioLivroPage> {
  GlobalKey<FormState> _formKey;
  LivroModel livro;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    livro = widget.livro ??
        LivroModel(
          id: Random().nextInt(255),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EF88),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 10),
              child: Text(
                'Inclua seu novo livro',
                style: TextStyle(
                  color: Color(0xFF498C9A),
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: TextFormField(
                initialValue: livro.titulo,
                decoration: InputDecoration(
                  hintText: 'Título',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onSaved: (titulo) => livro.titulo = titulo,
                validator: (titulo) =>
                    titulo.isEmpty ? 'Título é obigatório' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: TextFormField(
                initialValue: livro.descricao,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Descrição',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onSaved: (descricao) => livro.descricao = descricao,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28),
              child: Row(
                children: [
                  Text('Já li este livro'),
                  Checkbox(
                    value: livro.lido,
                    onChanged: (valor) {
                      setState(() {
                        livro.lido = valor;
                      });
                    },
                    activeColor: Colors.grey,
                  )
                ],
              ),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () {
                final form = _formKey.currentState;
                if (form.validate()) {
                  form.save();
                  widget.onCadastrar(livro);
                  Navigator.of(context).pop();
                }
              },
              padding: EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                'Cadastrar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
              color: Color(0xFFE67F22),
            )
          ],
        ),
      ),
    );
  }
}
