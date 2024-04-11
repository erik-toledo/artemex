class ObtenerProducto {
  final String idEmpresa;
  final String idProducto;
  final String idVendedor;
  final String direccion;
  final String nombreEmpresa;
  final String nombreProducto;
  final String estado;
  final String cantidad;
  final String precio;
  final String descripcionProducto;
  final String descripcionProveedor;
  final String image;
  final String estatus;
  final String categoria;

  ObtenerProducto({
    required this.direccion,
    required this.categoria,
    required this.idProducto,
    required this.idEmpresa,
    required this.cantidad,
    required this.nombreEmpresa,
    required this.nombreProducto,
    required this.idVendedor,
    required this.estado,
    required this.precio,
    required this.descripcionProducto,
    required this.descripcionProveedor,
    required this.image,
    required this.estatus,
  });
}
