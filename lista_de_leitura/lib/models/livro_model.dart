class LivroModel {
  LivroModel({
    this.id,
    this.titulo,
    this.descricao = '',
    this.lido = false,
  });

  int id;
  String titulo;
  String descricao;
  bool lido;

  bool operator ==(o) => o is LivroModel && id == o.id;
  int get hashCode => id;

  @override
  String toString() {
    return 'titulo: $titulo, descricao: $descricao, lido $lido';
  }
}
