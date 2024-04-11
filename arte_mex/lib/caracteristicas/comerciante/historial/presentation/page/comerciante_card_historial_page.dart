// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../comprador/historial/domain/entities/comprador_historial_compra.dart';

class ComercianteCardHistorialPage extends StatefulWidget {
  final double ancho;
  final double alto;
  final CompradorHistorialCompra compradorHistorialCompra;
  const ComercianteCardHistorialPage(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.compradorHistorialCompra});

  @override
  State<ComercianteCardHistorialPage> createState() =>
      _ComercianteCardHistorialPageState();
}

class _ComercianteCardHistorialPageState
    extends State<ComercianteCardHistorialPage> {
  @override
  Widget build(BuildContext context) {
    CompradorHistorialCompra historialCompra = widget.compradorHistorialCompra;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
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
                  imageUrl: historialCompra.image,
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
                        SizedBox(
                          width: widget.ancho / 5.5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              historialCompra.nombreEmpresa,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1, bottom: 20),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            historialCompra.ubicacion,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            historialCompra.nombreProducto,
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
                            historialCompra.cantidad,
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
                            "${historialCompra.precio}.00",
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
                          'Fecha de venta: ${historialCompra.fechaCompra}',
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
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text(
                    'Estatus',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                  Row(
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
                          historialCompra.estatusEntrega,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 6),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
