import 'dart:io';

import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/producto.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/usecase/actualizar_producto_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/usecase/crear_producto_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/usecase/eliminar_producto_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/usecase/obtener_producto_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/usecase/subir_imagen_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comerciante_producto_event.dart';
part 'comerciante_producto_state.dart';

class ComercianteProductoBloc
    extends Bloc<ComercianteProductoEvent, ComercianteProductoState> {
  final ActualizarProductoUsecase actualizarProductoUsecase;
  final CrearProductoUsecase crearProductoUsecase;
  final EliminarProductoUsecase eliminarProductoUsecase;
  final ObtenerProductoUsecase obtenerProductoUsecase;
  final SubirImagenUsecase subirImagenUsecase;
  Future<bool> crearProducto(Producto producto) async {
    try {
      return await crearProductoUsecase.execute(producto);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> actualizarProducto(String idProducto, Producto producto) async {
    try {
      return await actualizarProductoUsecase.execute(idProducto, producto);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> subirImagen(File image) async {
    try {
      return await subirImagenUsecase.execute(image);
    } catch (e) {
      rethrow;
    }
  }

  ComercianteProductoBloc({
    required this.actualizarProductoUsecase,
    required this.crearProductoUsecase,
    required this.eliminarProductoUsecase,
    required this.obtenerProductoUsecase,
    required this.subirImagenUsecase,
  }) : super(ComercianteProductoInicialState()) {
    on<ComercianteProductoEvent>(
      (event, emit) async {
        if (event is EventBotonObtenerProducto) {
          try {
            emit(ComercianteCargandoState());
            List<ObtenerProducto> productos =
                await obtenerProductoUsecase.execute(event.idUsuario);
            emit(ComercianteProductoCargadoState(productos: productos));
          } catch (e) {
            emit(ComercianteProductoError(error: e.toString()));
          }
        } else if (event is EventBotonEliminarProducto) {
          try {
            emit(ComercianteCargandoState());
            await eliminarProductoUsecase.execute(event.idProducto);
            emit(ComercianteProductoEliminadoState());
          } catch (e) {
            emit(ComercianteProductoError(error: e.toString()));
          }
        }
      },
    );
  }
}
