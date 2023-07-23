import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CompradorCardCompra extends StatefulWidget {
  final double ancho;
  final double alto;
  const CompradorCardCompra(
      {super.key, required this.ancho, required this.alto});

  @override
  State<CompradorCardCompra> createState() => _CompradorCardCompraState();
}

class _CompradorCardCompraState extends State<CompradorCardCompra> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: widget.alto / 4.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0XFFD9D9D9),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: widget.ancho / 3,
                height: widget.alto / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(5),
                  child: Image.asset(
                    'assets/local_imagenes/zapatilla.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          'assets/imagenes_iconos_card/tienda.svg',
                          width: 10,
                        ),
                      ),
                      Text(
                        'Artesanias Mx',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(
                          'assets/imagenes_iconos_card/verificado.svg',
                          width: 10,
                          colorFilter: const ColorFilter.mode(
                              Color(0XFF1D9BF0), BlendMode.srcIn),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          'assets/imagenes_iconos_card/ubicacion.svg',
                          width: 10,
                        ),
                      ),
                      Text(
                        'Tuxtla Gtz',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Licor artesanal',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          'Cantidad: ',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '5',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4, top: 2),
                        child: SvgPicture.asset(
                          'assets/imagenes_iconos_card/precio.svg',
                          width: 10,
                        ),
                      ),
                      Text(
                        '500.00',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Fecha de compra: 11/06/2023',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 5,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 37),
              child: Column(
                children: [
                  Text(
                    'Estatus',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Container(
                          width: widget.ancho / 40,
                          height: widget.alto / 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF00AC47),
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 6,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widget.ancho / 9,
                        child: Text(
                          'Entregado',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
