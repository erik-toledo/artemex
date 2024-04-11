import 'package:arte_mex/caracteristicas/comprador/carrito/domain/entities/carro.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/presentation/pages/widgets/comprador_carro.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_Appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utilidad/obtener_perfil_usuario.dart';
import '../bloc/comprador_carrito_bloc.dart';
import 'comprador_carro_compra_direccion_page.dart';

class CompradorCarroCompraPage extends StatefulWidget {
  const CompradorCarroCompraPage({super.key});

  @override
  State<CompradorCarroCompraPage> createState() =>
      _CompradorCarroCompraPageState();
}

class _CompradorCarroCompraPageState extends State<CompradorCarroCompraPage> {
  Comprador? comprador;
  double? total;
  bool esVacia = false;
  @override
  void initState() {
    obtenerPerfil(context);
    super.initState();
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
              child: BlocBuilder<CompradorCarritoBloc, CompradorCarritoState>(
                builder: (context, state) {
                  if (state is CompradorObteniendoCarritoState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CompradorCarritoObtenidoState) {
                    return (state.carro.isNotEmpty && comprador != null)
                        ? ListView.builder(
                            itemCount: state.carro.length,
                            itemBuilder: (context, index) {
                              return CompradorCarro(
                                ancho: ancho,
                                alto: alto,
                                carro: state.carro[index],
                                comprador: comprador!,
                              );
                            },
                          )
                        : const Center(
                            child: Text("No tienes productos agregados"),
                          );
                  } else if (state is CompradorCarritoError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return const Center();
                  }
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
                          (total != null) ? '\u{0024}$total' : "00.00",
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
                          (total != null) ? '\u{0024}$total' : "00.00",
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
                      onPressed: (esVacia)
                          ? () {
                              Route route = MaterialPageRoute(
                                builder: (context) =>
                                    CompradorCarroCompraDireccionPage(
                                        totalPago:
                                            (total != null) ? total : 0.0),
                              );
                              Navigator.push(context, route);
                            }
                          : null,
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

  void obtenerPerfil(BuildContext context) async {
    Object response = await obtenerPerfilUsuario(context);
    if (response is Comprador) {
      setState(() {
        comprador = response;
      });
    }

    // ignore: use_build_context_synchronously
    context
        .read<CompradorCarritoBloc>()
        .add(EventBotonObtenerCarro(idUsuario: comprador!.idComprador));
    calcularTotal();
  }

  void calcularTotal() async {
    double totalEnMetodo = 0.0;
    if (comprador != null) {
      List<Carro> lista = await context
          .read<CompradorCarritoBloc>()
          .obtenerLista(comprador!.idComprador);
      if (lista.isNotEmpty) {
        for (var element in lista) {
          totalEnMetodo +=
              double.parse(element.precio) * double.parse(element.cantidad);
        }
        setState(() {
          total = totalEnMetodo;
          esVacia = !esVacia;
        });
      } else {
        setState(() {
          total = totalEnMetodo;
        });
      }
    }
  }
}
