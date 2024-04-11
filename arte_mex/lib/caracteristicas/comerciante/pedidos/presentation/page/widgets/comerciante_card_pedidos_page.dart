// ignore_for_file: deprecated_member_use

import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/entities/pedido.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/presentation/page/comerciante_paqueteria_page.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_detalles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ComercianteCardPedidosPage extends StatefulWidget {
  final double ancho;
  final double alto;
  final Pedido pedido;
  final String idComerciante;
  const ComercianteCardPedidosPage(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.pedido,
      required this.idComerciante});

  @override
  State<ComercianteCardPedidosPage> createState() =>
      _ComercianteCardPedidosPageState();
}

class _ComercianteCardPedidosPageState
    extends State<ComercianteCardPedidosPage> {
  @override
  Widget build(BuildContext context) {
    Pedido pedido = widget.pedido;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
      child: InkWell(
        onTap: () {
          Route route = MaterialPageRoute(
            builder: (context) => ReutilizableWidgetDetalles(producto: pedido),
          );
          Navigator.push(context, route);
        },
        child: Container(
          width: widget.ancho / 1.3,
          height: widget.alto / 5,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(217, 217, 217, 1),
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: widget.ancho / 2.5,
                  height: widget.alto / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                    imageUrl: pedido.image,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  width: widget.ancho / 3.5,
                  height: widget.alto,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/imagenes_iconos_card/tienda.svg',
                            color: Colors.black,
                            width: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              'Artesanias Mx',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 1, bottom: 10),
                            child: SvgPicture.asset(
                              'assets/imagenes_iconos_card/verificado.svg',
                              color: const Color.fromRGBO(29, 155, 240, 1),
                              width: 10,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/imagenes_iconos_card/ubicacion.svg',
                            color: Colors.black,
                            width: 8,
                          ),
                          SizedBox(
                            width: widget.ancho / 4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text(
                                pedido.ubicacion,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: widget.ancho / 4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                pedido.nombreProducto,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              'Cantidad',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                              pedido.cantidad,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/imagenes_iconos_card/precio.svg',
                            width: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              "${pedido.precio}.00",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Fecha de venta: ${pedido.fechaCompra}',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 5.5,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Estatus',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: widget.ancho / 35,
                        height: widget.alto / 55,
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 8,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text(
                          pedido.estatusPago.toUpperCase(),
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 6),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: widget.ancho / 35,
                        height: widget.alto / 55,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text(
                          "${pedido.estatusEntrega.toUpperCase()} ",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 6),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 3, right: 3),
                    child: SizedBox(
                      width: widget.ancho / 6,
                      height: widget.alto / 30,
                      child: ElevatedButton(
                          onPressed: (pedido.estatusEntrega == "ESPERA")
                              ? () {
                                  Route route = MaterialPageRoute(
                                    builder: (context) =>
                                        ComerciantePaquetriaPage(
                                      idPedido: pedido.idCompra,
                                      idComerciante: widget.idComerciante,
                                    ),
                                  );
                                  Navigator.push(context, route);
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          child: Text(
                            'Enviar',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 4.3,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
