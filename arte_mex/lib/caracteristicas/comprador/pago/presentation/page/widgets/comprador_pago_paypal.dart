import 'package:arte_mex/caracteristicas/comprador/comprar/presentation/bloc/comprador_compra_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
//import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../navbar/navbar_comprador/navbar_comprador_route.dart';
import '../../../../carrito/domain/entities/carro.dart';

class CompradorPagoPayPal extends StatefulWidget {
  final String clientId;
  final String secretKey;
  final double ancho;
  final double alto;
  final Direccion direccion;
  final double total;
  final Comprador comprador;
  final List<Carro> productos;
  const CompradorPagoPayPal(
      {super.key,
      required this.clientId,
      required this.secretKey,
      required this.ancho,
      required this.alto,
      required this.direccion,
      required this.total,
      required this.comprador,
      required this.productos});

  @override
  State<CompradorPagoPayPal> createState() => _CompradorPagoPayPalState();
}

class _CompradorPagoPayPalState extends State<CompradorPagoPayPal> {
  bool completo = true;
  @override
  Widget build(BuildContext context) {
    final clientId = widget.clientId;
    final secretKey = widget.secretKey;
    final Direccion direccion = widget.direccion;
    final double total = widget.total;
    final Comprador comprador = widget.comprador;
    // final double ancho = widget.ancho;
    // final double alto = widget.ancho;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: widget.ancho,
        height: widget.alto / 13,
        child: ElevatedButton(
          onPressed: (completo)
              ? () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (BuildContext context1) => UsePaypal(
                        sandboxMode: true,
                        clientId: clientId,
                        secretKey: secretKey,
                        returnURL: "https://samplesite.com/return",
                        cancelURL: "https://samplesite.com/cancel",
                        transactions: [
                          {
                            "amount": {
                              "total": total.toString(),
                              "currency": "MXN",
                              "details": {
                                "subtotal": total.toString(),
                                "shipping": '0',
                                "shipping_discount": "0"
                              }
                            },
                            "description":
                                "The payment transaction description.",
                            // "payment_options": {
                            //   "allowed_payment_method":
                            //       "INSTANT_FUNDING_SOURCE"
                            // },
                            "item_list": {
                              "items": items(),
                              "shipping_address": {
                                "recipient_name": comprador.nombre.toString(),
                                "line1": direccion.calle.toString(),
                                "line2": "",
                                "city": direccion.estado.toString(),
                                "country_code": "US",
                                "postal_code":
                                    direccion.codigoPostal.toString(),
                                "phone": direccion.numeroTelf.toString(),
                                "state": direccion.estado.toString(),
                              },
                            }
                          }
                        ],
                        note:
                            "Contacta con nosotros por cualquier duda sobre tu pedido.",
                        onSuccess: (Map params) {},
                        onError: (error) {},
                        onCancel: (params) {
                          Navigator.pop(context1);
                        }),
                  ))
                      .whenComplete(() async {
                    bool response = await context
                        .read<CompradorCompraBloc>()
                        .crearCompra(
                            comprador.idComprador, crearDireccion(direccion));
                    if (response) {
                      setState(() {
                        completo = !completo;
                      });
                    }
                  });
                }
              : () {
                  Route route = MaterialPageRoute(
                    builder: (context) => const NavbarCompradorRoute(),
                  );
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                      context, route, (Route<dynamic> route) => false);
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff058EF7),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(5)),
          ),
          child: (completo)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pagar con ',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    const Text(
                      'PayPal ',
                      style: TextStyle(
                        fontFamily: 'Verdana',
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              : const Text("Ir al inicio"),
        ),
      ),
    );
  }

  List<Map<String, String>> items() {
    List<Map<String, String>> items = [];
    if (widget.productos.isNotEmpty) {
      for (var element in widget.productos) {
        var item = {
          "name": element.nombreProducto.toString(),
          "quantity": element.cantidad.toString(),
          "price": element.precio.toString(),
          "currency": "MXN"
        };
        items.add(item);
      }
    }
    return items;
  }

  String crearDireccion(Direccion direccion) =>
      "${direccion.calle} ${direccion.municipio} ${direccion.estado},CP:${direccion.codigoPostal}\n Num. Ext: ${direccion.numExterior} Num. Int:${direccion.numInterior}";
}
