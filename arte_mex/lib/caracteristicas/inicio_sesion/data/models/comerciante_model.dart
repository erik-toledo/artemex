import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';

class ComercianteModel extends Comerciante {
  ComercianteModel({
    required idVendedor,
    required nombre,
    required apellidos,
    required nombreEmpresa,
    required estado,
    required correo,
    required rfc,
    required contrasena,
    required verificado,
    required tipoUsuario,
    required numeroTelefonico,
  }) : super(
          numeroTelefonico: numeroTelefonico,
          idVendedor: idVendedor,
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
      numeroTelefonico: comerciante["numeroTelefonico"],
      idVendedor: comerciante['idvendedor'].toString(),
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
      numeroTelefonico: comerciante.numeroTelefonico,
      idVendedor: comerciante.idVendedor,
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

  Map<String, dynamic> toJson() {
    return {
      "numeroTelefonico": numeroTelefonico,
      'idvendedor': idVendedor,
      "nombre": nombre,
      "apellidos": apellidos,
      "nombreEmpresa": nombreEmpresa,
      "estado": estado,
      "correo": correo,
      "rfc": rfc,
      "contrasena": contrasena,
      "verificado": verificado,
      "tipoUsuario": tipoUsuario,
    };
  }
}
