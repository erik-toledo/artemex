// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProductoItem extends StatefulWidget {
  final double ancho;
  final double alto;
  const CardProductoItem({super.key, required this.ancho, required this.alto});

  @override
  State<CardProductoItem> createState() => _CardProductoItemState();
}

class _CardProductoItemState extends State<CardProductoItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 2, right: 1.5, top: 4, bottom: 5),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/local_imagenes/zapatilla.jpg',
                        fit: BoxFit.cover,
                      ),
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
                          'Artesanias Mx',
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
                          'Tuxtla Gtz',
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
                          'Tacones artesanales bordadados a mano',
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
                                  '500.00',
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
        Padding(
          padding: const EdgeInsets.only(right: 2),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/local_imagenes/zapatilla.jpg',
                        fit: BoxFit.cover,
                      ),
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
                          'Artesanias Mx',
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
                          'Tuxtla Gtz',
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
                          'Tacones artesanales bordadados a mano',
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
                                  '500.00',
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
      ],
    );
  }
}
