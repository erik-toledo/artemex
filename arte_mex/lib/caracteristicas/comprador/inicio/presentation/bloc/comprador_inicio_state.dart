part of 'comprador_inicio_bloc.dart';

@immutable
abstract class CompradorInicioState {}

class CompradorInicioInicialState extends CompradorInicioState {}

class CompradorInicioObteniendoArticulosState extends CompradorInicioState {}

class CompradorInicioArticulosObtenidosState extends CompradorInicioState {
  final List<ObtenerProducto> productos;
  CompradorInicioArticulosObtenidosState({required this.productos});
}

class CompradorInicioErrorState extends CompradorInicioState {
  final String error;
  CompradorInicioErrorState({required this.error});
}

class CompradorInicioCategoriaObtenidosState extends CompradorInicioState {
  final List<Categoria> categoria;
  CompradorInicioCategoriaObtenidosState({required this.categoria});
}

class CompradorInicioCategoriaErrorState extends CompradorInicioState {
  final String error;
  CompradorInicioCategoriaErrorState({required this.error});
}
