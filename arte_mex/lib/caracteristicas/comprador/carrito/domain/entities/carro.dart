class Carro {
  final String idVendedor;
  final String idCarro;
  final String idProducto;
  final String nombreProducto;
  final String estado;
  final String precio;
  final String cantidad;
  final String descripcionProducto;
  final String descripcionProveedor;
  final String image;
  final String nombreEmpresa;
  final String estatus;
  final String idComprador;

  Carro({
    required this.idProducto,
    required this.idCarro,
    required this.idComprador,
    required this.cantidad,
    required this.nombreEmpresa,
    required this.idVendedor,
    required this.nombreProducto,
    required this.estado,
    required this.precio,
    required this.descripcionProducto,
    required this.descripcionProveedor,
    required this.image,
    required this.estatus,
  });
}