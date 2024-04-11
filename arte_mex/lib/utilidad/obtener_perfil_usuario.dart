import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../caracteristicas/inicio_sesion/presentation/bloc/inicio_sesion_bloc.dart';

Future<Object> obtenerPerfilUsuario(BuildContext context) async {
  Object response =
      await context.read<InicioSesionBloc>().obtenerInformacionUsuario();
  if (response is Comerciante) {
    return response;
  } else if (response is Comprador) {
    return response;
  }
  return Comerciante;
}
