import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/producto.dart';

class ProductoModel extends Producto {
  ProductoModel({
    required String nombreProducto,
    required String estado,
    required String precio,
    required String descripcionProducto,
    required String descripcionProveedor,
    required String image,
    required String estatus,
  }) : super(
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
      nombreProducto: productos['nombreProducto,'],
      estado: productos['estado,'],
      precio: productos['precio,'],
      descripcionProducto: productos['descripcionProducto,'],
      descripcionProveedor: productos['descripcionProveedor,'],
      image: productos['image,'],
      estatus: productos['estatus,'],
    );
  }
  factory ProductoModel.fronEntity(Producto producto) {
    return ProductoModel(
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
      'nombreProducto': nombreProducto,
      'estado': estado,
      'precio': precio,
      'descripcionProducto': descripcionProducto,
      'descripcionProveedor': descripcionProveedor,
      'image': image,
      'estatus': estatus,
    };
  }
}
