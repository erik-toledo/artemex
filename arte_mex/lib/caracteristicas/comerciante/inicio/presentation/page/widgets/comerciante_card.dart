import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardTipoLarga(double ancho, double alto) {
  return Container(
    width: ancho / 2.8,
    height: alto / 1.55,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(217, 217, 217, 1),
        borderRadius: BorderRadius.circular(5)),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Container(
            width: ancho / 3.5,
            height: alto / 4.5,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                'Licor artesanal',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 8,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Cantidad: ',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 7,
                    ),
                  ),
                  Text(
                    '5',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 7,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/imagenes_iconos_card/destino.svg',
                    width: 7,
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                  Text(
                    'Suchiapa, Chiapas',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 6,
                    ),
                  )
                ],
              ),
              Text(
                'Total:',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 7,
                ),
              ),
              Text(
                '2500.00',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.purple,
                    shadows: <BoxShadow>[
                      const BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 9,
                        color: Color.fromRGBO(0, 0, 0, 0.200),
                      )
                    ]),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/imagenes_iconos_card/ver.svg',
                    width: 15,
                    colorFilter:
                        const ColorFilter.mode(Colors.purple, BlendMode.srcIn),
                  ),
                  Text(
                    'Mas detalles',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 4,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
