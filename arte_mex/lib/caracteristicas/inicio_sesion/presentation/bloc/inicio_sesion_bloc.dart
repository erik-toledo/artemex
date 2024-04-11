import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/sesion.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/usecases/iniciar_sesion_usecase.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/presentation/bloc/inicio_sesion_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/inicio_sesion_obtener_informacion_usuario.dart';

abstract class InicioSesionEvent {}

class InicioSesionBloc extends Bloc<InicioSesionEvent, InicioSesionState> {
  final IniciarSesionUsecase iniciarSesionUsecase;
  final InicioSesionObtenerInformacionUsuarioUsecase informacionUsuarioUsecase;

  Future<bool> inicioSesion(Sesion sesion) async {
    try {
      bool response = await iniciarSesionUsecase.execute(sesion);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Object> obtenerInformacionUsuario() async {
    try {
      return await informacionUsuarioUsecase.execute();
    } catch (e) {
      rethrow;
    }
  }

  InicioSesionBloc(
      {required this.iniciarSesionUsecase,
      required this.informacionUsuarioUsecase})
      : super(InicioSesionInicioState()) {
    on<InicioSesionEvent>(
      (event, emit) {},
    );
  }
}
