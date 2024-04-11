import 'dart:convert';

import 'package:arte_mex/caracteristicas/inicio_sesion/data/models/comerciante_model.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/data/models/comprador_model.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/data/models/inicio_sesion_model.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/sesion.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utilidad/host.dart';

abstract class InicioSesionRemoteDataSource {
  Future<bool> iniciarSesionnRemoteDataSource(Sesion sesion);
}

class InicioSesionRemoteDataSourceImpl implements InicioSesionRemoteDataSource {
  String rutaComerciante = hostComerciante();
  String rutaComprador = hostComprador();
  Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  @override
  Future<bool> iniciarSesionnRemoteDataSource(Sesion sesion) async {
    final SharedPreferences localData = await SharedPreferences.getInstance();
    localData.clear();

    var sesionModel = InicioSesionModel.fromEntity(sesion);
    var sesionBody = sesionModel.toJson();
    var body = jsonEncode(sesionBody);
    var urlComerciante = Uri.parse("$rutaComerciante/vendedor/inicioSesion");
    var urlComprador = Uri.parse("$rutaComprador/comprador/inicioSesion");

    try {
      var responseComerciante =
          await http.post(urlComerciante, body: body, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      var responseComprador =
          await http.post(urlComprador, body: body, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

      if (responseComerciante.statusCode == 200) {
        List<ComercianteModel> respuesta = jsonDecode(responseComerciante.body)
            .map<ComercianteModel>(
                (comerciante) => ComercianteModel.fromJson(comerciante))
            .toList();

        localData.setString(
            'usuario', jsonEncode(ComercianteModel.fromEntity(respuesta[0])));
        return true;
      } else if (responseComprador.statusCode == 200) {
        List<CompradorModel> respuestaComprador =
            jsonDecode(responseComprador.body)
                .map<CompradorModel>(
                    (comprador) => CompradorModel.fromJson(comprador))
                .toList();

        localData.setString('usuario',
            jsonEncode(CompradorModel.fromEntity(respuestaComprador[0])));

        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
