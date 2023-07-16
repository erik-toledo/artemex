import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';

class ComercianteModel extends Comerciante {
  ComercianteModel({
    required nombre,
    required apellidos,
    required nombreEmpresa,
    required estado,
    required correo,
    required rfc,
    required contrasena,
    required verificado,
    required tipoUsuario,
  }) : super(
          nombre: nombre,
          apellidos: apellidos,
          nombreEmpresa: nombreEmpresa,
          estado: estado,
          correo: correo,
          rfc: rfc,
          contrasena: contrasena,
          verificado: verificado,
          tipoUsuario: tipoUsuario,
        );

  factory ComercianteModel.fromJson(Map<String, dynamic> comerciante) {
    return ComercianteModel(
      nombre: comerciante['nombre'],
      apellidos: comerciante['apellidos'],
      nombreEmpresa: comerciante['nombreEmpresa'],
      estado: comerciante['estado'],
      correo: comerciante['correo'],
      rfc: comerciante['rfc'],
      contrasena: comerciante['contrasena'],
      verificado: comerciante['verificado'],
      tipoUsuario: comerciante['tipoUsuario'],
    );
  }

  factory ComercianteModel.fromEntity(Comerciante comerciante) {
    return ComercianteModel(
      nombre: comerciante.nombre,
      apellidos: comerciante.apellidos,
      nombreEmpresa: comerciante.nombreEmpresa,
      estado: comerciante.estado,
      correo: comerciante.correo,
      rfc: comerciante.rfc,
      contrasena: comerciante.contrasena,
      verificado: comerciante.verificado,
      tipoUsuario: comerciante.tipoUsuario,
    );
  }
}
