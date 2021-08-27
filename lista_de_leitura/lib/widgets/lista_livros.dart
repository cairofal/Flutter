import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_leitura/models/livro_model.dart';
import 'package:lista_de_leitura/pages/formulario_livro-page.dart';
import 'package:lista_de_leitura/widgets/linha_horizontal.dart';

class ListaLivros extends StatelessWidget {
  ListaLivros(
      {this.listaLivros, @required this.onCadastrar, @required this.onDeletar});

  final Set<LivroModel> listaLivros;
  final Function(LivroModel) onCadastrar;
  final Function(LivroModel) onDeletar;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(), //permite a rolagem da tela
      shrinkWrap: true,
      itemBuilder: (context, i) {
        final livro = listaLivros.elementAt(i);
        return ListTile(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => FormularioLivroPage(
                    livro: livro,
                    onCadastrar: onCadastrar,
                  ))),
          trailing: GestureDetector(
            onTap: () {
              onDeletar(livro);
            },
            child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(Icons.delete_forever)),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 58),
            child: Text(
              livro.titulo,
              style: TextStyle(
                color: livro.lido ? Colors.grey : Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                decoration: livro.lido ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 58),
            child: Text(
              livro.descricao,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: livro.lido ? Colors.grey : Colors.black,
                decoration: livro.lido ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.all(0),
        );
      },
      separatorBuilder: (context, i) => LinhaHorizontal(),
      itemCount: listaLivros.length,
    );
  }
}
