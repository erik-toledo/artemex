import 'package:arte_mex/caracteristicas/comprador/historial/domain/entities/comprador_historial_compra.dart';
import 'package:arte_mex/caracteristicas/comprador/historial/domain/usecase/comprador_obtener_historial_compra_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comprador_historial_event.dart';
part 'comprador_historial_state.dart';
class CompradorHistorialBloc
    extends Bloc<CompradorHistorialEvent, CompradorHistorialState> {
  final CompradorObtenerHistorialCompraUsecase obtenerHistorialCompraUsecase;
  CompradorHistorialBloc({required this.obtenerHistorialCompraUsecase})
      : super(CompradorHistorialInicialState()) {
    on<CompradorHistorialEvent>(
      (event, emit) async {
        if (event is EventBotonCompradorObtenerHistorial) {
          try {
            emit(CompradorHistorialObteniendoHistorial());
            List<CompradorHistorialCompra> historial =
                await obtenerHistorialCompraUsecase.execute(event.idComprador);
            emit(CompradorHistorialObtenidoState(historial: historial));
          } catch (e) {
            emit(CompradorHistorialErrorState(error: e.toString()));
          }
        }
      },
    );
  }
}
