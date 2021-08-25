class LivroModel {
  LivroModel({
    this.titulo,
    this.descricao = '',
    this.lido = false,
  });

  String titulo;
  String descricao;
  bool lido;

  @override
  String toString() {
    return 'titulo: $titulo, descricao: $descricao, lido $lido';
  }
}
