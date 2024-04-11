import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/sesion.dart';

class InicioSesionModel extends Sesion {
  InicioSesionModel({
    required String correo,
    required String contrasena,
  }) : super(
          correo: correo,
          contrasena: contrasena,
        );

  factory InicioSesionModel.fromJson(Map<String, dynamic> sesion) {
    return InicioSesionModel(
      correo: sesion["correo"],
      contrasena: sesion["contrasena"],
    );
  }
  factory InicioSesionModel.fromEntity(Sesion sesion) {
    return InicioSesionModel(
      correo: sesion.correo,
      contrasena: sesion.contrasena,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "correo": correo,
      "contrasena": contrasena,
    };
  }
}
