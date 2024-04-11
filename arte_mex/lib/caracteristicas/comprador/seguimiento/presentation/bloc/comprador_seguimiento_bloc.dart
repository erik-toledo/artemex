import 'package:arte_mex/caracteristicas/comprador/comprar/domain/entities/compra.dart';
import 'package:arte_mex/caracteristicas/comprador/seguimiento/domain/usecases/comprador_seguimiento_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comprador_seguimiento_event.dart';
part 'comprador_seguimiento_state.dart';
class CompradorSeguimientoBloc
    extends Bloc<CompradorSeguimientoEvent, CompradorSeguimientoState> {
  CompradorSeguimientoUsecase compradorSeguimientoUsecase;
  CompradorSeguimientoBloc({required this.compradorSeguimientoUsecase})
      : super(CompradorSeguimientoInicialState()) {
    on<CompradorSeguimientoEvent>(
      (event, emit) async {
        if (event is EventBotonObtenerSeguimiento) {
          try {
            emit(CompradorObteniendoSeguimientoState());
            List<Compra> compraSeguimiento =
                await compradorSeguimientoUsecase.excute(event.idUsuario);
            emit(CompradorSeguimientoObtenidoState(
                seguimiento: compraSeguimiento));
          } catch (e) {
            emit(CompradorSeguimientoError(error: e.toString()));
          }
        }
      },
    );
  }
}
