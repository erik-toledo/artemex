import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';

class RegistroComercianteModel extends Comerciante {
  RegistroComercianteModel({
    required String idVendedor,
    required String nombre,
    required String apellidos,
    required String nombreEmpresa,
    required String estado,
    required String correo,
    required String rfc,
    required String contrasena,
    required String verificado,
    required String tipoUsuario,
    required String numeroTelefonico,
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

  factory RegistroComercianteModel.fromJson(Map<String, dynamic> comerciante) {
    return RegistroComercianteModel(
      numeroTelefonico: comerciante["numeroTelefonico"],
      idVendedor: comerciante["idvendedor"].toString(),
      nombre: comerciante["nombre"],
      apellidos: comerciante["apellidos"],
      nombreEmpresa: comerciante["nombreEmpresa"],
      estado: comerciante["estado"],
      correo: comerciante["correo"],
      rfc: comerciante["rfc"],
      contrasena: comerciante["contrasena"],
      verificado: comerciante["verificado"],
      tipoUsuario: comerciante["tipoUsuario"],
    );
  }

  factory RegistroComercianteModel.fromEntity(Comerciante comerciante) {
    return RegistroComercianteModel(
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
