import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';

class CompradorModel extends Comprador {
  CompradorModel({
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

  factory CompradorModel.fromJson(Map<String, dynamic> comprador) {
    return CompradorModel(
      idComprador: comprador['idcomprador'].toString(),
      nombre: comprador['nombre'],
      apellidos: comprador['apellidos'],
      correo: comprador['correo'],
      contrasena: comprador['contrasena'],
      tipoUsuario: comprador['tipoUsuario'],
    );
  }

  factory CompradorModel.fromEntity(Comprador comprador) {
    return CompradorModel(
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
      "idcomprador": idComprador,
      "nombre": nombre,
      "apellidos": apellidos,
      "correo": correo,
      "contrasena": contrasena,
      "tipoUsuario": tipoUsuario,
    };
  }
}
