import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';

class RegistroCompradorModel extends Comprador {
  RegistroCompradorModel({
    required String idComprador,
    required String nombre,
    required String apellidos,
    required String correo,
    required String contrasena,
    required String tipoUsuario,
  }) : super(
          idComprador: idComprador,
          nombre: nombre,
          apellidos: apellidos,
          correo: correo,
          contrasena: contrasena,
          tipoUsuario: tipoUsuario,
        );

  factory RegistroCompradorModel.fromJson(Map<String, dynamic> comprador) {
    return RegistroCompradorModel(
      idComprador: comprador['idComprador'].toString(),
      nombre: comprador['nombre'],
      apellidos: comprador['apellidos'],
      correo: comprador['correo'],
      contrasena: comprador['contrasena'],
      tipoUsuario: comprador['tipoUsuario'],
    );
  }

  factory RegistroCompradorModel.fromEntity(Comprador comprador) {
    return RegistroCompradorModel(
      idComprador: comprador.idComprador,
      nombre: comprador.nombre,
      apellidos: comprador.apellidos,
      correo: comprador.correo,
      contrasena: comprador.contrasena,
      tipoUsuario: comprador.tipoUsuario,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nombre": nombre,
      "apellidos": apellidos,
      "correo": correo,
      "contrasena": contrasena,
      "tipoUsuario": tipoUsuario,
    };
  }
}
