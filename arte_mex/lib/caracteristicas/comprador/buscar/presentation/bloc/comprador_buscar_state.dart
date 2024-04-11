part of 'comprador_buscar_bloc.dart';

@immutable
abstract class CompradorBuscarState {}

class CompradorBuscarInicial extends CompradorBuscarState {}

class CompradorObteniendoBuscarState extends CompradorBuscarState {}

class CompradorBusquedaObtenidaState extends CompradorBuscarState {
  final List<ObtenerProducto> producto;
  CompradorBusquedaObtenidaState({required this.producto});
}

class CompradorBusquedaErrorState extends CompradorBuscarState {
  final String error;
  CompradorBusquedaErrorState({required this.error});
}
