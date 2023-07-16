import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';

class ObtenerProductoModel extends ObtenerProducto {
  ObtenerProductoModel({
    required String idEmpresa,
    required String nombreEmpresa,
    required String nombreProducto,
    required String estado,
    required String precio,
    required String descripcionProducto,
    required String descripcionProveedor,
    required String image,
    required String estatus,
  }) : super(
          idEmpresa: idEmpresa,
          nombreEmpresa: nombreEmpresa,
          nombreProducto: nombreProducto,
          estado: estado,
          precio: precio,
          descripcionProducto: descripcionProducto,
          descripcionProveedor: descripcionProveedor,
          image: image,
          estatus: estatus,
        );

  factory ObtenerProductoModel.fromJson(Map<String, dynamic> productos) {
    return ObtenerProductoModel(
      idEmpresa: productos['idEmpresa'],
      nombreEmpresa: productos['nombreEmpresa'],
      nombreProducto: productos['nombreProducto,'],
      estado: productos['estado,'],
      precio: productos['precio,'],
      descripcionProducto: productos['descripcionProducto,'],
      descripcionProveedor: productos['descripcionProveedor,'],
      image: productos['image,'],
      estatus: productos['estatus,'],
    );
  }
  factory ObtenerProductoModel.fronEntity(ObtenerProducto producto) {
    return ObtenerProductoModel(
      idEmpresa: producto.idEmpresa,
      nombreEmpresa: producto.nombreEmpresa,
      nombreProducto: producto.nombreProducto,
      estado: producto.estado,
      precio: producto.precio,
      descripcionProducto: producto.descripcionProducto,
      descripcionProveedor: producto.descripcionProveedor,
      image: producto.image,
      estatus: producto.estatus,
    );
  }
  // Map<String, dynamic> toJson() {
  //   return {
  //     'idEmpresa': idEmpresa, ctrl + } 
  //     'nombreEmpresa': nombreEmpresa,
  //     'nombreProducto': nombreProducto,
  //     'estado': estado,
  //     'precio': precio,
  //     'descripcionProducto': descripcionProducto,
  //     'descripcionProveedor': descripcionProveedor,
  //     'image': image,
  //     'estatus': estatus,
  //   };
  // }
}
