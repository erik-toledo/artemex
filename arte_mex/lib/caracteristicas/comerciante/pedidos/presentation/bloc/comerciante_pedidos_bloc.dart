import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/entities/pedido.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/usecase/actualizar_estatus_pedido_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/usecase/obtener_pedidos_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comerciante_pedidos_event.dart';
part 'comerciante_pedidos_state.dart';

class ComerciantePedidosBloc
    extends Bloc<ComerciantePedidosEvent, ComerciantePedidosState> {
  final ObtenerPedidosUsecase obtenerPedidosUsecase;
  final ActualizarEstatusPedidoUsecase actualizarEstatusPedidoUsecase;

  Future<bool> actualizarEstatusPedido(
      String id, String estatus, String empresa) async {
    return await actualizarEstatusPedidoUsecase.execute(id, estatus, empresa);
  }

  ComerciantePedidosBloc(
      {required this.obtenerPedidosUsecase,
      required this.actualizarEstatusPedidoUsecase})
      : super(ComerciantePedidosInicialState()) {
    on<ComerciantePedidosEvent>(
      (event, emit) async {
        if (event is EventBotonObtenerPedidos) {
          try {
            emit(ComercianteObteniendoPedidosState());
            List<Pedido> pedidos =
                await obtenerPedidosUsecase.execute(event.idUsuario);
            emit(ComerciantePedidosObtenidosState(pedidos: pedidos));
          } catch (e) {
            emit(ComercianteErrorPedidosState(error: e.toString()));
          }
        }
      },
    );
  }
}
