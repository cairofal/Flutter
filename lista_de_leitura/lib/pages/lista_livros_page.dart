import 'package:flutter/material.dart';
import 'package:lista_de_leitura/models/livro_model.dart';
import 'package:lista_de_leitura/widgets/linha_horizontal.dart';
import 'package:lista_de_leitura/widgets/lista_livros.dart';

class ListaLivrosPage extends StatefulWidget {
  @override
  ListaLivrosPageState createState() => ListaLivrosPageState();
}

class ListaLivrosPageState extends State<ListaLivrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF1EF88),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 58),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lista de leitura',
                            style: TextStyle(
                              color: Color(0xFF498C9A),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            )),
                        FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                          mini: true,
                        )
                      ],
                    ),
                  ),
                  LinhaHorizontal(),
                  ListaLivros(
                    listaLivros: listaLivrosMock,
                  ),
                  LinhaHorizontal(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38),
                child: VerticalDivider(
                  color: Colors.red[200],
                  thickness: 3,
                ),
              )
            ],
          ),
        )));
  }
}
