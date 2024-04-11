import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';

class CompradorDireccionModel extends Direccion {
  CompradorDireccionModel({
    required String idDireccion,
    required String estado,
    required String codigoPostal,
    required String municipio,
    required String calle,
    required String numExterior,
    required String numInterior,
    required String numeroTelf,
    required String descripcionDomicilio,
    required String idUsuario,
  }) : super(
          idUsuario: idUsuario,
          idDireccion: idDireccion,
          estado: estado,
          codigoPostal: codigoPostal,
          municipio: municipio,
          calle: calle,
          numExterior: numExterior,
          numInterior: numInterior,
          numeroTelf: numeroTelf,
          descripcionDomicilio: descripcionDomicilio,
        );

  factory CompradorDireccionModel.fromJson(Map<String, dynamic> direcciones) {
    return CompradorDireccionModel(
      idUsuario: direcciones["idUsuario"].toString(),
      idDireccion: direcciones["iddirrecion"].toString(),
      estado: direcciones["estado"],
      codigoPostal: direcciones["codigoPostal"].toString(),
      municipio: direcciones["municipio"],
      calle: direcciones["calle"],
      numExterior: direcciones["numeroExterior"].toString(),
      numInterior: direcciones["numeroInterior"].toString(),
      numeroTelf: direcciones["numeroTelefonico"].toString(),
      descripcionDomicilio: direcciones["descripcion"],
    );
  }
  factory CompradorDireccionModel.fromEntity(Direccion direccion) {
    return CompradorDireccionModel(
      idUsuario: direccion.idUsuario,
      idDireccion: direccion.idDireccion,
      estado: direccion.estado,
      codigoPostal: direccion.codigoPostal,
      municipio: direccion.municipio,
      calle: direccion.calle,
      numExterior: direccion.numExterior,
      numInterior: direccion.numInterior,
      numeroTelf: direccion.numeroTelf,
      descripcionDomicilio: direccion.descripcionDomicilio,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "iddirrecion": idDireccion,
      "estado": estado,
      "codigoPostal": codigoPostal,
      "municipio": municipio,
      "calle": calle,
      "numeroExterior": numExterior,
      "numeroInterior": numInterior,
      "numeroTelefonico": numeroTelf,
      "idUsuario": idUsuario,
      "descripcion": descripcionDomicilio,
    };
  }
}
