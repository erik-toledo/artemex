abstract class InicioSesionRemoteDataSource {
  Future<bool> iniciarSesionnRemoteDataSource(String correo, String contrasena);
}

class InicioSesionRemoteDataSourceImpl implements InicioSesionRemoteDataSource {
  @override
  Future<bool> iniciarSesionnRemoteDataSource(
      String correo, String contrasena) {
    throw UnimplementedError();
  }
}
