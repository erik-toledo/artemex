import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';

class ObtenerProductoModel extends ObtenerProducto {
  ObtenerProductoModel({
    required String idEmpresa,
    required String idProducto,
    required String idVendedor,
    required String nombreEmpresa,
    required String nombreProducto,
    required String estado,
    required String precio,
    required String descripcionProducto,
    required String descripcionProveedor,
    required String cantidad,
    required String image,
    required String estatus,
    required String categoria,
    required String direccion,
  }) : super(
          direccion: direccion,
          categoria: categoria,
          cantidad: cantidad,
          idVendedor: idVendedor,
          idProducto: idProducto,
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
      direccion: (productos["direccion"] != null)
          ? productos["direccion"]
          : "No direccion",
      categoria: productos["categoria"],
      idProducto: productos["idproducto"].toString(),
      nombreProducto: productos['nombreProducto'],
      estado: productos['estado'],
      precio: productos['precio'].toString(),
      cantidad: productos["cantidad"].toString(),
      idVendedor: productos["idvendedor"].toString(),
      descripcionProducto: productos['descripcionProducto'],
      descripcionProveedor: productos['descripcionProveedor'],
      nombreEmpresa: productos["nombreEmpresa"],
      image: productos['image'],
      estatus: productos['estatus'],
      idEmpresa: productos['idvendedor'].toString(),
    );
  }

  factory ObtenerProductoModel.fronEntity(ObtenerProducto producto) {
    return ObtenerProductoModel(
      direccion: producto.direccion,
      idVendedor: producto.idVendedor,
      categoria: producto.categoria,
      idProducto: producto.idProducto,
      cantidad: producto.cantidad,
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
