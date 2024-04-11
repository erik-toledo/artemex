import 'package:arte_mex/caracteristicas/comprador/carrito/domain/entities/carro.dart';

class CompradorCarroModel extends Carro {
  CompradorCarroModel({
    required String idComprador,
    required String idProducto,
    required String idVendedor,
    required String nombreEmpresa,
    required String nombreProducto,
    required String estado,
    required String cantidad,
    required String precio,
    required String descripcionProducto,
    required String descripcionProveedor,
    required String image,
    required String estatus,
    required String idCarro,
  }) : super(
          idProducto: idProducto,
          idCarro: idCarro,
          idComprador: idComprador,
          nombreEmpresa: nombreEmpresa,
          cantidad: cantidad,
          idVendedor: idVendedor,
          nombreProducto: nombreProducto,
          estado: estado,
          precio: precio,
          descripcionProducto: descripcionProducto,
          descripcionProveedor: descripcionProveedor,
          image: image,
          estatus: estatus,
        );

  factory CompradorCarroModel.fromJson(Map<String, dynamic> carro) {
    return CompradorCarroModel(
      idProducto: carro["idproducto"].toString(),
      idCarro: carro["idcarrito"].toString(),
      idComprador: carro["idcomprador"].toString(),
      cantidad: carro["cantidad"].toString(),
      idVendedor: carro["idvendedor"].toString(),
      nombreProducto: carro['nombreProducto'],
      estado: carro['estado'],
      precio: carro['precio'].toString(),
      descripcionProducto: carro['descripcionProducto'],
      nombreEmpresa: carro["nombreEmpresa"],
      descripcionProveedor: carro['descripcionProveedor'],
      image: carro['image'],
      estatus: carro['estatus'],
    );
  }
  factory CompradorCarroModel.fronEntity(Carro carro) {
    return CompradorCarroModel(
      idProducto: carro.idProducto,
      idCarro: carro.idCarro,
      idComprador: carro.idComprador,
      nombreEmpresa: carro.nombreEmpresa,
      cantidad: carro.cantidad,
      idVendedor: carro.idVendedor,
      nombreProducto: carro.nombreProducto,
      estado: carro.estado,
      precio: carro.precio,
      descripcionProducto: carro.descripcionProducto,
      descripcionProveedor: carro.descripcionProveedor,
      image: carro.image,
      estatus: carro.estatus,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'idvendedor': idVendedor,
      'idcomprador': idComprador,
      'nombreProducto': nombreProducto,
      'idproducto': idProducto,
      'estado': estado,
      'nombreEmpresa': nombreEmpresa,
      'precio': precio,
      'cantidad': cantidad,
      'descripcionProducto': descripcionProducto,
      'descripcionProveedor': descripcionProveedor,
      'image': image,
      'estatus': estatus,
    };
  }
}
