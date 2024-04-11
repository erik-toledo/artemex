import 'package:arte_mex/caracteristicas/comerciante/historial/domain/usecase/comerciante_obtener_historial_venta_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/historial/presentation/bloc/comerciante_historial_event.dart';
import 'package:arte_mex/caracteristicas/comerciante/historial/presentation/bloc/comerciante_historial_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../comprador/historial/domain/entities/comprador_historial_compra.dart';

class ComercianteHistorialBloc
    extends Bloc<ComercianteHistorialEvent, ComercianteHistorialState> {
  final ComercianteObtenerHistorialVentaUsecase obtenerHistorialVentaUsecase;
  ComercianteHistorialBloc({required this.obtenerHistorialVentaUsecase})
      : super(ComercianteHistorialInicialState()) {
    on<ComercianteHistorialEvent>(
      (event, emit) async {
        if (event is EventBotonObtenerHistorial) {
          try {
            emit(ComercianteObteniendoHistorialState());
            List<CompradorHistorialCompra> historial =
                await obtenerHistorialVentaUsecase.execute(event.idComerciante);
            emit(ComercianteHistorialObtenidoState(historial: historial));
          } catch (e) {
            emit(ComercianteHistorialErrorState(error: e.toString()));
          }
        }
      },
    );
  }
}
