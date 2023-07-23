import 'package:arte_mex/caracteristicas/comprador/pago/presentation/page/widgets/comprador_pago_paypal.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CompradorPagoPage extends StatefulWidget {
  const CompradorPagoPage({super.key});

  @override
  State<CompradorPagoPage> createState() => _CompradorPagoPageState();
}

class _CompradorPagoPageState extends State<CompradorPagoPage> {
  String clientId = dotenv.get("CLIENT_ID");
  String secretKey = dotenv.get("SECRET_KEY");
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          ReutilizableWidgetAppbar(
              ancho: ancho, alto: alto, titulo: "Pago", regresar: true),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: ancho,
            child: Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/logo_paypal/paypal_logo.svg",
                      width: 300,
                    ),
                    const Positioned(
                      top: 265,
                      left: 105,
                      child: SizedBox(
                        child: Row(
                          children: [
                            Text(
                              "Pay",
                              style: TextStyle(
                                  fontFamily: 'Verdana',
                                  fontSize: 20,
                                  color: Color(0xff00447B)),
                            ),
                            Text(
                              "Pal",
                              style: TextStyle(
                                  fontFamily: 'Verdana',
                                  fontSize: 20,
                                  color: Color(0xff0079C2)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: alto / 30),
          Container(
            width: ancho / 1.1,
            height: alto / 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffE4E4E4),
            ),
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
                ],
              ),
            ),
          ),
          SizedBox(height: alto / 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CompradorPagoPayPal(
                clientId: clientId,
                secretKey: secretKey,
                ancho: ancho,
                alto: alto),
          ),
        ],
      ),
    );
  }
}