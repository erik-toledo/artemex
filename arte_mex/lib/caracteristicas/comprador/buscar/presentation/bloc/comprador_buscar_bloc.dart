import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/buscar/domain/usecase/comprador_busqueda_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comprador_buscar_event.dart';
part 'comprador_buscar_state.dart';

class CompradorBuscarBloc
    extends Bloc<CompradorBuscarEvent, CompradorBuscarState> {
  final CompradorBusquedaUsease compradorBusquedaUsease;

  CompradorBuscarBloc({required this.compradorBusquedaUsease})
      : super(CompradorBuscarInicial()) {
    on<CompradorBuscarEvent>(
      (event, emit) async {
        if (event is EventBotonBuscar) {
          try {
            emit(CompradorObteniendoBuscarState());
            List<ObtenerProducto> productos =
                await compradorBusquedaUsease.execute(event.criterio);
            emit(CompradorBusquedaObtenidaState(producto: productos));
          } catch (e) {
            emit(CompradorBusquedaErrorState(error: e.toString()));
          }
        } else if (event is EvenBotonReiniciar) {
          emit(CompradorBuscarInicial());
        }
      },
    );
  }
}
