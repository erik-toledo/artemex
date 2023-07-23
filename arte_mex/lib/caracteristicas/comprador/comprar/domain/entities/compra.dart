class Compra {
  final String nombreEmpresa;
  final String nombreProducto;
  final String cantidad;
  final String descripcionProducto;
  final String precio;
  final String total;
  final String fechaCompra;
  final String estatusPago;
  final String estatusEntrega;
  final String ubicacion;
  final String tipoEnvio;
  final String idUsuario;
  final String idEmpresa;
  final String image;

  Compra({
    required this.nombreEmpresa,
    required this.nombreProducto,
    required this.cantidad,
    required this.descripcionProducto,
    required this.precio,
    required this.total,
    required this.fechaCompra,
    required this.estatusPago,
    required this.estatusEntrega,
    required this.ubicacion,
    required this.tipoEnvio,
    required this.idUsuario,
    required this.idEmpresa,
    required this.image,
  });
}
