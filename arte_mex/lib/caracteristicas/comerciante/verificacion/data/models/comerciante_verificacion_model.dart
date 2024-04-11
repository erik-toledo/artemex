import 'package:arte_mex/caracteristicas/comerciante/verificacion/domain/entitites/verificacion.dart';

class ComercianteVerificacionModel extends Verificacion {
  ComercianteVerificacionModel({
    required String nombreEmpresa,
    required String estado,
    required String telefono,
    required String rfc,
  }) : super(
          nombreEmpresa: nombreEmpresa,
          estado: estado,
          telefono: telefono,
          rfc: rfc,
        );

  factory ComercianteVerificacionModel.fromJson(
      Map<String, dynamic> verificacion) {
    return ComercianteVerificacionModel(
      nombreEmpresa: verificacion["nombreEmpresa"],
      estado: verificacion["estado"],
      telefono: verificacion["telefono"],
      rfc: verificacion["rfc"],
    );
  }

  factory ComercianteVerificacionModel.fromEntity(Verificacion verificacion) {
    return ComercianteVerificacionModel(
      nombreEmpresa: verificacion.nombreEmpresa,
      estado: verificacion.estado,
      telefono: verificacion.telefono,
      rfc: verificacion.rfc,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nombreEmpresa": nombreEmpresa,
      "estado": estado,
      "telefono": telefono,
      "rfc": rfc,
    };
  }
}
