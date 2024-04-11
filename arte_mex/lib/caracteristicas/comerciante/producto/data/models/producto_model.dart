import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/producto.dart';

class ProductoModel extends Producto {
  ProductoModel({
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
    required String categoria,
    
  }) : super(
          categoria: categoria,
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

  factory ProductoModel.fromJson(Map<String, dynamic> productos) {
    return ProductoModel(
      categoria: productos["categoria"],
      cantidad: productos["cantidad"].toString(),
      idVendedor: productos["idvendedor"].toString(),
      nombreProducto: productos['nombreProducto'],
      estado: productos['estado'],
      precio: productos['precio'].toString(),
      descripcionProducto: productos['descripcionProducto'],
      nombreEmpresa: productos["nombreEmpresa"],
      descripcionProveedor: productos['descripcionProveedor'],
      image: productos['image'],
      estatus: productos['estatus'],
    );
  }
  factory ProductoModel.fronEntity(Producto producto) {
    return ProductoModel(
      categoria: producto.categoria,
      nombreEmpresa: producto.nombreEmpresa,
      cantidad: producto.cantidad,
      idVendedor: producto.idVendedor,
      nombreProducto: producto.nombreProducto,
      estado: producto.estado,
      precio: producto.precio,
      descripcionProducto: producto.descripcionProducto,
      descripcionProveedor: producto.descripcionProveedor,
      image: producto.image,
      estatus: producto.estatus,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'idvendedor': idVendedor,
      'categoria': categoria,
      'nombreProducto': nombreProducto,
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
