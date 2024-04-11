import 'package:arte_mex/caracteristicas/comprador/inicio/domain/entities/categoria.dart';

class CompradorCategoriaModel extends Categoria {
  CompradorCategoriaModel({required String categoria})
      : super(categoria: categoria);

  factory CompradorCategoriaModel.fromJson(Map<String, dynamic> categoria) {
    return CompradorCategoriaModel(categoria: categoria["categoria"]);
  }

  factory CompradorCategoriaModel.fromEntity(Categoria categoria) {
    return CompradorCategoriaModel(categoria: categoria.categoria);
  }
}
