import 'package:arte_mex/caracteristicas/comprador/comprar/domain/repositories/comprador_compra_repository.dart';

class CompradorCompraUsecase {
  final CompradorCompraRepository compradorCompraRepository;
  CompradorCompraUsecase({required this.compradorCompraRepository});

  Future<bool> execute( String idUsuario,String direccion) async {
    return await compradorCompraRepository.crearCompraRepository(
         idUsuario,direccion);
  }
}
