import 'package:arte_mex/caracteristicas/comprador/carrito/presentation/pages/widgets/comprador_carro.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_Appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'comprador_carro_compra_direccion_page.dart';

class CompradorCarroCompraPage extends StatefulWidget {
  const CompradorCarroCompraPage({super.key});

  @override
  State<CompradorCarroCompraPage> createState() =>
      _CompradorCarroCompraPageState();
}

class _CompradorCarroCompraPageState extends State<CompradorCarroCompraPage> {
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
            titulo: 'Carrito de compras',
            regresar: true,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: ancho / 1.1,
              height: alto / 1.9,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return CompradorCarro(ancho: ancho, alto: alto);
                },
              ),
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      onPressed: () {
                        Route route = MaterialPageRoute(
                          builder: (context) =>
                              const CompradorCarroCompraDireccionPage(),
                        );
                        Navigator.push(context, route);
                      },
                      child: Text(
                        'Continuar compra',
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
    );
  }
}
