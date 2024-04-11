import 'package:arte_mex/caracteristicas/comprador/carrito/domain/entities/carro.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/domain/usecases/comprador_agregar_producto_carrito_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/domain/usecases/comprador_eliminar_producto_carrito_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/domain/usecases/comprador_obtener_carrito_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comprador_carrito_event.dart';
part 'comprador_carrito_state.dart';

class CompradorCarritoBloc
    extends Bloc<CompradorCarritoEvent, CompradorCarritoState> {
  final CompradorAgregarProductoCarritoUsecase
      compradorAgregarProductoCarritoUsecase;
  final CompradorEliminarProductoCarritoUsecase
      compradorEliminarProductoCarritoUsecase;
  final CompradorObtenerCarritoUsecase compradorObtenerCarritoUsecase;

  Future<List<Carro>> obtenerLista(String id) async {
    try {
      return await compradorObtenerCarritoUsecase.execute(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> agregarCarro(String id, Carro carro) async {
    try {
      return await compradorAgregarProductoCarritoUsecase.execute(id, carro);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> eliminarCarro(String id) async {
    try {
      return await compradorEliminarProductoCarritoUsecase.execute(id);
    } catch (e) {
      rethrow;
    }
  }

  CompradorCarritoBloc({
    required this.compradorAgregarProductoCarritoUsecase,
    required this.compradorEliminarProductoCarritoUsecase,
    required this.compradorObtenerCarritoUsecase,
  }) : super(CompradorCarritoInicial()) {
    on<CompradorCarritoEvent>(
      (event, emit) async {
        if (event is EventBotonObtenerCarro) {
          try {
            emit(CompradorObteniendoCarritoState());
            List<Carro> carro =
                await compradorObtenerCarritoUsecase.execute(event.idUsuario);
            emit(CompradorCarritoObtenidoState(carro: carro));
          } catch (e) {
            emit(CompradorCarritoError(error: e.toString()));
          }
        }
      },
    );
  }
}
