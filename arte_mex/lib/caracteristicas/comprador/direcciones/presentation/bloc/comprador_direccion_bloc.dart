import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/usecases/comprador_crear_direccion_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/usecases/comprador_eliminar_direccion_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/usecases/comprador_obtener_direccion_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/comprador_actualizar_direccion_usecase.dart';

part 'comprador_direccion_event.dart';
part 'comprador_direccion_state.dart';

class CompradorDireccionBloc
    extends Bloc<CompradorDireccionEvent, CompradorDireccionState> {
  final CompradorActualizarDireccionUsecase compradorActualizarDireccionUsecase;
  final CompradorCrearDireccionUsecase compradorCrearDireccionUsecase;
  final CompradorEliminarDireccionUsecase compradorEliminarDireccionUsecase;
  final CompradorObtenerDireccionUsecase compradorObtenerDireccionUsecase;

  Future<bool> eliminarDireccion(String idUsuario) async {
    try {
      return await compradorEliminarDireccionUsecase.execute(idUsuario);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> editarDireccion(String id, Direccion direccion) async {
    try {
      return await compradorActualizarDireccionUsecase.execute(id, direccion);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> crearDireccion(String id, Direccion direccion) async {
    try {
      return await compradorCrearDireccionUsecase.execute(id, direccion);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Direccion>> direcciones(String id) async {
    try {
      return await compradorObtenerDireccionUsecase.execute(id);
    } catch (e) {
      rethrow;
    }
  }

  CompradorDireccionBloc({
    required this.compradorActualizarDireccionUsecase,
    required this.compradorCrearDireccionUsecase,
    required this.compradorEliminarDireccionUsecase,
    required this.compradorObtenerDireccionUsecase,
  }) : super(CompradorDireccionInicial()) {
    on<CompradorDireccionEvent>(
      (event, emit) async {
        if (event is EventBotonObtenerDireccion) {
          try {
            emit(CompradorObteniendoDireccionState());
            List<Direccion> direccion =
                await compradorObtenerDireccionUsecase.execute(event.idUsuario);
            emit(CompradorDireccionObtenidaState(direcciones: direccion));
          } catch (e) {
            emit(CompradorDireccionErrorState(error: e.toString()));
          }
        }
      },
    );
  }
}
