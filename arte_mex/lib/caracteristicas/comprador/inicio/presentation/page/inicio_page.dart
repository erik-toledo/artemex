// ignore_for_file: deprecated_member_use

import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/card_producto_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(144, 13, 211, 1),
        title: SizedBox(
          width: ancho,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ARTE  ',
                style: GoogleFonts.simonetta(
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: Colors.white),
              ),
              Text(
                'M',
                style: GoogleFonts.simonetta(
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: const Color.fromRGBO(97, 121, 70, 1)),
              ),
              Text(
                'E',
                style: GoogleFonts.simonetta(
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: const Color.fromRGBO(234, 168, 18, 1)),
              ),
              Text(
                'X',
                style: GoogleFonts.simonetta(
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: const Color.fromRGBO(206, 49, 119, 1)),
              ),
            ],
          ),
        ),
      ),
      //ciculos estados
      body: Column(
        children: [
          SizedBox(
            width: ancho / 1.1,
            height: alto / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: ancho / 7,
                  height: alto / 10,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 32,
                        top: 21.5,
                        child: Text(
                          '0',
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 9,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 15,
                        child: SvgPicture.asset(
                          'assets/imagenes_iconos_comerciante/carrito.svg',
                          width: 40,
                          color: const Color.fromRGBO(97, 121, 70, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ancho,
            height: alto / 6,
            alignment: Alignment.center,
            child: SizedBox(
              width: ancho / 1.1,
              height: alto / 6,
              child: Column(
                children: [
                  SizedBox(
                    height: alto / 8,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/imagenes_estados/chiapas.jpg'),
                          radius: 40,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/imagenes_estados/oaxaca.jpg'),
                          radius: 40,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/imagenes_estados/yucatan.jpg'),
                          radius: 40,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: ancho / 1.1,
                    height: alto / 24.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 7),
                          width: ancho / 3.3,
                          child: Text(
                            'Chiapas',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              color: const Color.fromRGBO(97, 121, 70, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ancho / 3.3,
                          child: Text('Oaxaca',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                color: const Color.fromRGBO(97, 121, 70, 1),
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          width: ancho / 3.3,
                          child: Text('Yucatan',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                color: const Color.fromRGBO(97, 121, 70, 1),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                SizedBox(
                    width: ancho / 1.1,
                    height: alto / 2.3,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CardProductoItem(ancho: ancho, alto: alto);
                      },
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
