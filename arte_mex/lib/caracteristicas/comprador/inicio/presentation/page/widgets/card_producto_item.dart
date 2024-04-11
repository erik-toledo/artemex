// ignore_for_file: deprecated_member_use

import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/comprador_detalle_producto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProductoItem extends StatefulWidget {
  final double ancho;
  final double alto;
  final ObtenerProducto producto;
  const CardProductoItem(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.producto});

  @override
  State<CardProductoItem> createState() => _CardProductoItemState();
}

class _CardProductoItemState extends State<CardProductoItem> {
  @override
  Widget build(BuildContext context) {
    ObtenerProducto producto = widget.producto;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 2,
          ),
          child: InkWell(
            onTap: () {
              Route route = MaterialPageRoute(
                builder: (context) =>
                    CompradorDetalleProducto(producto: producto),
              );
              Navigator.push(context, route);
            },
            child: Container(
              width: widget.ancho / 2.24,
              height: widget.alto / 3.59,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 5, left: 8, right: 8),
                    child: Container(
                      width: widget.ancho / 2.3,
                      height: widget.alto / 7,
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
                        imageUrl: producto.image,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widget.ancho / 2.5,
                    height: widget.alto / 40,
                    child: Row(
                      children: [
                        SizedBox(
                          width: widget.ancho / 16,
                          child: SvgPicture.asset(
                            'assets/imagenes_iconos_card/tienda.svg',
                            color: Colors.black,
                            width: 11,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: widget.ancho / 4,
                          height: widget.alto,
                          child: Text(
                            producto.nombreEmpresa,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 9,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: widget.ancho / 12,
                          height: widget.alto / 40,
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            'assets/imagenes_iconos_card/verificado.svg',
                            color: const Color.fromRGBO(29, 155, 240, 1),
                            width: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widget.ancho / 2.5,
                    height: widget.alto / 40,
                    child: Row(
                      children: [
                        SizedBox(
                          width: widget.ancho / 16,
                          child: SvgPicture.asset(
                            'assets/imagenes_iconos_card/ubicacion.svg',
                            color: Colors.black,
                            width: 11,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: widget.ancho / 3,
                          height: widget.alto,
                          child: Text(
                            producto.estado,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 9,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widget.ancho / 2.5,
                    height: widget.alto / 30,
                    child: Row(
                      children: [
                        SizedBox(
                          width: widget.ancho / 16,
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          width: widget.ancho / 3,
                          height: widget.alto,
                          child: Text(
                            producto.descripcionProducto,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 6,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widget.ancho / 3.5,
                    height: widget.alto / 30,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 3),
                          alignment: Alignment.topCenter,
                          width: widget.ancho / 20,
                          child: SvgPicture.asset(
                            'assets/imagenes_iconos_card/precio.svg',
                            width: 13,
                          ),
                        ),
                        SizedBox(
                            width: widget.ancho / 4.3,
                            height: widget.alto / 20,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: -8,
                                  child: Text(
                                    '${producto.precio}.00',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
