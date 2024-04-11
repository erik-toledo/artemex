import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';
import 'package:arte_mex/caracteristicas/comprador/pago/presentation/page/widgets/comprador_pago_paypal.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:arte_mex/utilidad/bloqueo_captura_pantalla.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utilidad/obtener_perfil_usuario.dart';
import '../../../carrito/domain/entities/carro.dart';
import '../../../carrito/presentation/bloc/comprador_carrito_bloc.dart';

class CompradorPagoPage extends StatefulWidget {
  final Direccion direccion;
  final double total;
  const CompradorPagoPage(
      {super.key, required this.direccion, required this.total});

  @override
  State<CompradorPagoPage> createState() => _CompradorPagoPageState();
}

class _CompradorPagoPageState extends State<CompradorPagoPage> {
  Comprador? comprador;
  List<Carro> productos = [];
  @override
  void initState() {
    bloquearCapturaPantalla();
    obtenerPerfil(context);
    super.initState();
  }

  String clientId = dotenv.get("CLIENT_ID");
  String secretKey = dotenv.get("SECRET_KEY");
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    double total = widget.total;
    Direccion direccion = widget.direccion;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          ReutilizableWidgetAppbar(
            ancho: ancho,
            alto: alto,
            titulo: "Pago",
            regresar: true,
          ),
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
                          '\u{0024}$total.00',
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
                          '\u{0024}$total.00',
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
            child: (comprador != null)
                ? CompradorPagoPayPal(
                    clientId: clientId,
                    secretKey: secretKey,
                    ancho: ancho,
                    alto: alto,
                    total: total,
                    direccion: direccion,
                    comprador: comprador!,
                    productos: productos,
                  )
                : const Text("No user"),
          ),
        ],
      ),
    );
  }

  void obtenerPerfil(BuildContext context) async {
    Object response = await obtenerPerfilUsuario(context);
    if (response is Comprador) {
      setState(() {
        comprador = response;
      });
    }
    // ignore: use_build_context_synchronously
    List<Carro> lista = await context
        .read<CompradorCarritoBloc>()
        .obtenerLista(comprador!.idComprador);
    setState(() {
      productos = lista;
    });
    // ignore: use_build_context_synchronously
  }
}
