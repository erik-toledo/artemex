import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/entities/categoria.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/usecase/comprador_obtener_categoria_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/usecase/comprador_obtener_categorias_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/usecase/comprador_obtener_estado_categoria_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/usecase/comprador_obtener_producto_categoria_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/usecase/comprador_obtener_producto_inicio_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comprador_inicio_event.dart';
part 'comprador_inicio_state.dart';

class CompradorInicioBloc
    extends Bloc<CompradorIncioEvent, CompradorInicioState> {
  final CompradorObtenerProductoInicioUsecase obtenerProductoInicioUsecase;
  final CompradorObtenerCategoriaUsecase categoriaUsecase;
  final CompradorObtenerCategoriasUsecase compradorObtenerCategoriasUsecase;
  final CompradorObtenerPrudctoCategoriaInicioUsecase
      compradorObtenerCategoriaInicioUsecase;
  final CompradorObtenerEstadoCategoriaUsecase
      compradorObtenerEstadoCategoriaUsecase;

  Future<List<Categoria>> obtenerCategorias() async {
    try {
      return await compradorObtenerCategoriasUsecase.execute();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> obtenerEstadoCategoria(String estado) async {
    try {
      return await compradorObtenerEstadoCategoriaUsecase.execute(estado);
    } catch (e) {
      rethrow;
    }
  }

  CompradorInicioBloc(
      {required this.obtenerProductoInicioUsecase,
      required this.compradorObtenerEstadoCategoriaUsecase,
      required this.compradorObtenerCategoriaInicioUsecase,
      required this.compradorObtenerCategoriasUsecase,
      required this.categoriaUsecase})
      : super(CompradorInicioInicialState()) {
    on<CompradorIncioEvent>(
      (event, emit) async {
        if (event is EventBotonObtenerArticulos) {
          try {
            emit(CompradorInicioObteniendoArticulosState());
            List<ObtenerProducto> productos =
                await obtenerProductoInicioUsecase.execute();
            emit(CompradorInicioArticulosObtenidosState(productos: productos));
          } catch (e) {
            emit(CompradorInicioErrorState(error: e.toString()));
          }
        } else if (event is EventBotonObtenerCategorias) {
          try {
            emit(CompradorInicioObteniendoArticulosState());
            List<Categoria> categoria =
                await categoriaUsecase.execute(event.estado);
            emit(CompradorInicioCategoriaObtenidosState(categoria: categoria));
          } catch (e) {
            emit(CompradorInicioCategoriaErrorState(error: e.toString()));
          }
        } else if (event is EventBotonObtenerProductosCategorias) {
          try {
            emit(CompradorInicioObteniendoArticulosState());
            List<ObtenerProducto> productos =
                await compradorObtenerCategoriaInicioUsecase
                    .execute(event.categoria);
            emit(CompradorInicioArticulosObtenidosState(productos: productos));
          } catch (e) {
            emit(CompradorInicioErrorState(error: e.toString()));
          }
        } else if (event is EventBotonReiniciarEvent) {
          emit(CompradorInicioInicialState());
        }
      },
    );
  }
}
