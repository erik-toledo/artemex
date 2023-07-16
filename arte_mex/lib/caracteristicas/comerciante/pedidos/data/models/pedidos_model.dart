import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/entities/pedido.dart';

class PedidoModel extends Pedido {
  PedidoModel({
    required String nombreEmpresa,
    required String nombreProducto,
    required String cantidad,
    required String descripcionProducto,
    required String precio,
    required String total,
    required String fechaCompra,
    required String estatusPago,
    required String estatusEntrega,
    required String ubicacion,
    required String tipoEnvio,
    required String idUsuario,
    required String idEmpresa,
    required String image,
  }) : super(
          nombreEmpresa: nombreEmpresa,
          nombreProducto: nombreProducto,
          cantidad: cantidad,
          descripcionProducto: descripcionProducto,
          precio: precio,
          total: total,
          fechaCompra: fechaCompra,
          estatusPago: estatusPago,
          estatusEntrega: estatusEntrega,
          ubicacion: ubicacion,
          tipoEnvio: tipoEnvio,
          idUsuario: idUsuario,
          idEmpresa: idEmpresa,
          image: image,
        );
  factory PedidoModel.fromJson(Map<String, dynamic> productos) {
    return PedidoModel(
      nombreEmpresa: productos['nombreEmpresa'],
      nombreProducto: productos['nombreProducto'],
      cantidad: productos['cantidad'],
      descripcionProducto: productos['descripcionProducto'],
      precio: productos['precio'],
      total: productos['total'],
      fechaCompra: productos['fechaCompra'],
      estatusPago: productos['estatusPago'],
      estatusEntrega: productos['estatusEntrega'],
      ubicacion: productos['ubicacion'],
      tipoEnvio: productos['tipoEnvio'],
      idUsuario: productos['idUsuario'],
      idEmpresa: productos['idEmpresa'],
      image: productos['image'],
    );
  }
  factory PedidoModel.fromEntity(Pedido pedido) {
    return PedidoModel(
      nombreEmpresa: pedido.nombreEmpresa,
      nombreProducto: pedido.nombreProducto,
      cantidad: pedido.cantidad,
      descripcionProducto: pedido.descripcionProducto,
      precio: pedido.precio,
      total: pedido.total,
      fechaCompra: pedido.fechaCompra,
      estatusPago: pedido.estatusPago,
      estatusEntrega: pedido.estatusEntrega,
      ubicacion: pedido.ubicacion,
      tipoEnvio: pedido.tipoEnvio,
      idUsuario: pedido.idUsuario,
      idEmpresa: pedido.idEmpresa,
      image: pedido.image,
    );
  }
}
