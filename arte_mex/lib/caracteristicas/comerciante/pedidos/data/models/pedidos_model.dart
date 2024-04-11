import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/entities/pedido.dart';

class PedidoModel extends Pedido {
  PedidoModel({
    required String nombreEmpresa,
    required String idCompra,
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
    required String direccion,
  }) : super(
          direccion: direccion,
          idCompra: idCompra,
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
  factory PedidoModel.fromJson(Map<String, dynamic> pedido) {
    return PedidoModel(
      direccion:
          (pedido["direccion"] != null) ? pedido["direccion"] : "No direccion",
      idCompra: pedido["idcompra"].toString(),
      nombreEmpresa: pedido['nombreEmpresa'],
      nombreProducto: pedido['nombreProducto'],
      cantidad: pedido['cantidad'].toString(),
      descripcionProducto: pedido['descripcionProducto'],
      precio: pedido['precio'].toString(),
      total: pedido['total'].toString(),
      fechaCompra: pedido['fechaCompra'],
      idUsuario: pedido['idUsuario'].toString(),
      idEmpresa: pedido['idvendedor'].toString(),
      estatusEntrega: pedido['estatus'],
      estatusPago: pedido['estatusPago'],
      ubicacion: pedido['ubicacion'],
      tipoEnvio: pedido['empresaenvio'],
      image: pedido['image'],
    );
  }
  factory PedidoModel.fromEntity(Pedido pedido) {
    return PedidoModel(
      direccion: pedido.direccion,
      idCompra: pedido.idCompra,
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
