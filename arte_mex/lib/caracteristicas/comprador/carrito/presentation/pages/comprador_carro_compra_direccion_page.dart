import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/presentation/page/widgets/comprador_card_direccion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets_reutilizables/reutilizable_widget_Appbar.dart';

class CompradorCarroCompraDireccionPage extends StatefulWidget {
  const CompradorCarroCompraDireccionPage({super.key});

  @override
  State<CompradorCarroCompraDireccionPage> createState() =>
      _CompradorCarroCompraDireccionPageState();
}

class _CompradorCarroCompraDireccionPageState
    extends State<CompradorCarroCompraDireccionPage> {
  List<Direccion> direcciones = [
    Direccion(
        estado: "Chiapas",
        codigoPostal: "29150",
        municipio: "Suchiapa",
        calle: "Av. Primera Nte. Ote. 800",
        numExterior: "808",
        numInterior: "1",
        numeroTelf: "9661156789",
        descripcionDomicilio: "Casa gris"),
    Direccion(
        estado: "Chiapas",
        codigoPostal: "29150",
        municipio: "Suchiapa",
        calle: "Av. Primera Nte. Ote. 800",
        numExterior: "809",
        numInterior: "1",
        numeroTelf: "9661156789",
        descripcionDomicilio: "Casa gris"),
  ];
  Direccion? direccion;
  int indexSeleccionado = -1;
  bool esIgual = false;
  void cardSeleccionda(int index) {
    setState(() {
      direccion = direcciones[index];
      indexSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          ReutilizableWidgetAppbar(
            ancho: ancho,
            alto: alto,
            titulo: 'Datos de envio',
            regresar: true,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: ancho / 1.1,
              height: alto / 1.9,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return CompradorCardDireccion(
                    ancho: ancho,
                    alto: alto,
                    esSeleccionado: (indexSeleccionado == index),
                    onTap: () => cardSeleccionda(index),
                    direccion: direcciones[index],
                  );
                },
              ),
            ),
            Container(
              width: ancho / 1.1,
              height: alto / 4.5,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.274),
                    ),
                    BoxShadow(
                      color: Color(0xffD9D9D9),
                      offset: Offset(0, 5),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total del producto:',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          width: ancho / 3,
                          child: Text(
                            '\u{0024}1000.00',
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Costo del envio:',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          width: ancho / 3,
                          child: Text(
                            '\u{0024}00.00',
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total a pagar:',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          width: ancho / 3,
                          child: Text(
                            '\u{0024}1000.00',
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: ancho / 1.1,
                      height: alto / 14,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onPressed: () {},
                        child: Text(
                          "Continuar compra",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
