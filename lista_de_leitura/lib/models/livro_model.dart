class LivroModel {
  LivroModel({
    this.titulo,
    this.descricao = '',
    this.lido = false,
  });

  String titulo;
  String descricao;
  bool lido;
}

final listaLivros = [
  LivroModel(
      titulo: 'Codigo limpo', descricao: 'Ótimo livro. Recomendo', lido: true),
  LivroModel(
    titulo: 'C completo e total',
    descricao: 'Ótimo livro. Recomendo',
    lido: false,
  ),
  LivroModel(titulo: 'Java use a cabeça', descricao: 'Livro bom', lido: true),
];
