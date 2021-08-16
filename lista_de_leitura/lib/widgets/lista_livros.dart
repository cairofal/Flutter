import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_leitura/models/livro_model.dart';
import 'package:lista_de_leitura/widgets/linha_horizontal.dart';

class ListaLivros extends StatelessWidget {
  ListaLivros({this.listaLivros});

  final List<LivroModel> listaLivros;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(), //permite a rolagem da teal
      shrinkWrap: true,
      itemBuilder: (context, i) {
        final livro = listaLivros[i];
        return ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 58),
            child: Text(
              livro.titulo,
              style: TextStyle(
                  color: livro.lido ? Colors.grey : Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 58),
            child: Text(
              livro.descricao,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.black),
            ),
          ),
          visualDensity: VisualDensity.compact,
        );
      },
      separatorBuilder: (context, i) => LinhaHorizontal(),
      itemCount: listaLivros.length,
    );
  }
}
