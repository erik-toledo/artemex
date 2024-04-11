import 'dart:io';

import '../repositories/producto_repository.dart';

class SubirImagenUsecase {
  final ProductoRepository productoRepository;

  SubirImagenUsecase({required this.productoRepository});

  Future<String> execute(File image) async {
    return await productoRepository.subirImagenRepository(image);
  }
}
