import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../comprar/domain/entities/compra.dart';

class CompradorCardDetalleSeguimiento extends StatefulWidget {
  final double ancho;
  final double alto;
  final Compra compra;
  const CompradorCardDetalleSeguimiento({
    super.key,
    required this.ancho,
    required this.alto,
    required this.compra,
  });

  @override
  State<CompradorCardDetalleSeguimiento> createState() =>
      _CompradorCardDetalleSeguimientoState();
}

class _CompradorCardDetalleSeguimientoState
    extends State<CompradorCardDetalleSeguimiento> {
  @override
  Widget build(BuildContext context) {
    final ancho = widget.ancho;
    final alto = widget.alto;
    final compra = widget.compra;
    return Container(
      width: ancho / 1.13,
      height: alto,
      decoration: BoxDecoration(
        color: const Color(0xffE2E2E2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            width: ancho,
            height: alto / 4.4,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: ancho / 2.5,
                    height: alto / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
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
                      imageUrl: compra.image,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: SvgPicture.asset(
                                "assets/imagenes_iconos_card/tienda.svg",
                                width: 10,
                              ),
                            ),
                            SizedBox(
                              width: ancho / 4.7,
                              child: Text(
                                compra.nombreEmpresa,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35),
                              child: SvgPicture.asset(
                                "assets/imagenes_iconos_card/verificado.svg",
                                width: 12,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xff1D9BF0),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: SvgPicture.asset(
                                "assets/imagenes_iconos_card/ubicacion.svg",
                                width: 10,
                              ),
                            ),
                            SizedBox(
                              width: ancho / 3,
                              child: Text(
                                compra.ubicacion,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            compra.nombreProducto,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ancho / 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              compra.descripcionProducto,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Cantidad: ",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              compra.cantidad,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3, top: 3),
                              child: SvgPicture.asset(
                                "assets/imagenes_iconos_card/precio.svg",
                                width: 14,
                              ),
                            ),
                            Text(
                              "${compra.precio}.00",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Text(
              "Total: ${compra.total}.00",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.purple,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              compra.estatusEntrega,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: ancho,
              height: alto / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Paqueteria ${compra.tipoEnvio}",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Gracias por su compra",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
