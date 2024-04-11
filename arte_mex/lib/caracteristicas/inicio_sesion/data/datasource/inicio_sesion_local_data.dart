import 'dart:convert';

import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class InicioSesionLocalData {
  Future<Object> informacionUsuario();
}

class InicioSesionLocalDataImpl implements InicioSesionLocalData {
  @override
  Future<Object> informacionUsuario() async {
    final SharedPreferences localData = await SharedPreferences.getInstance();
    if (localData.containsKey("usuario")) {
      var informacionUsuario = localData.getString('usuario') ?? "[]";
      final respuesta = jsonDecode(informacionUsuario);
      Comerciante? comerciante;
      Comprador? comprador;
      if (respuesta["tipoUsuario"] == "COMERCIANTE") {
        comerciante = Comerciante(
          numeroTelefonico: respuesta["numeroTelefonico"],
          idVendedor: respuesta['idvendedor'],
          nombre: respuesta["nombre"],
          apellidos: respuesta["apellidos"],
          nombreEmpresa: respuesta["nombreEmpresa"],
          estado: respuesta["estado"],
          correo: respuesta["correo"],
          rfc: respuesta["rfc"],
          contrasena: respuesta["contrasena"],
          verificado: respuesta["verificado"],
          tipoUsuario: respuesta["tipoUsuario"],
        );
      } else if (respuesta["tipoUsuario"] == "COMPRADOR") {
        comprador = Comprador(
          idComprador: respuesta["idcomprador"],
          nombre: respuesta["nombre"],
          apellidos: respuesta["apellidos"],
          correo: respuesta["correo"],
          contrasena: respuesta["contrasena"],
          tipoUsuario: respuesta["tipoUsuario"],
        );
      }
      if (comerciante != null) {
        return comerciante;
      } else if (comprador != null) {
        return comprador;
      }
    }
    return "Error";
  }
}
