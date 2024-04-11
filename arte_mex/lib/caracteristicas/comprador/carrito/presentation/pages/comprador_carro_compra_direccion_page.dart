import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/presentation/bloc/comprador_direccion_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/presentation/page/comprador_nueva_direccion_page.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/presentation/page/widgets/comprador_card_direccion.dart';
import 'package:arte_mex/caracteristicas/comprador/pago/presentation/page/comprador_pago_page.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utilidad/obtener_perfil_usuario.dart';
import '../../../../../widgets_reutilizables/reutilizable_widget_Appbar.dart';

class CompradorCarroCompraDireccionPage extends StatefulWidget {
  final double? totalPago;
  const CompradorCarroCompraDireccionPage({super.key, required this.totalPago});

  @override
  State<CompradorCarroCompraDireccionPage> createState() =>
      _CompradorCarroCompraDireccionPageState();
}

class _CompradorCarroCompraDireccionPageState
    extends State<CompradorCarroCompraDireccionPage> {
  Comprador? comprador;

  Direccion? direccion;
  int indexSeleccionado = -1;
  bool esIgual = false;
  @override
  void initState() {
    obtenerPerfil(context);
    super.initState();
  }

  void cardSeleccionda(int index, List<Direccion> direcciones) {
    setState(() {
      direccion = direcciones[index];
      indexSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    double? total = (widget.totalPago != null) ? widget.totalPago : 0.0;
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
                child: BlocBuilder<CompradorDireccionBloc,
                    CompradorDireccionState>(
                  builder: (context, state) {
                    if (state is CompradorObteniendoDireccionState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CompradorDireccionObtenidaState) {
                      return (state.direcciones.isNotEmpty && comprador != null)
                          ? ListView.builder(
                              itemCount: state.direcciones.length,
                              itemBuilder: (context, index) {
                                return CompradorCardDireccion(
                                  ancho: ancho,
                                  alto: alto,
                                  esSeleccionado: (indexSeleccionado == index),
                                  onTap: () =>
                                      cardSeleccionda(index, state.direcciones),
                                  direccion: state.direcciones[index],
                                  idUsuario: comprador!.idComprador,
                                );
                              },
                            )
                          : mensageNoDirecciones(
                              context,
                              (comprador != null)
                                  ? comprador!.idComprador
                                  : '0');
                    } else if (state is CompradorDireccionErrorState) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else {
                      return const Center();
                    }
                  },
                )),
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
                    SizedBox(
                      width: ancho / 1.1,
                      height: alto / 14,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onPressed: (direccion != null && total != null)
                            ? () {
                                Route route = MaterialPageRoute(
                                  builder: (context) => CompradorPagoPage(
                                      direccion: direccion!, total: total),
                                );
                                Navigator.push(context, route);
                              }
                            : null,
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

  void obtenerPerfil(BuildContext context) async {
    Object response = await obtenerPerfilUsuario(context);
    if (response is Comprador) {
      setState(() {
        comprador = response;
      });
    }
    // ignore: use_build_context_synchronously
    context
        .read<CompradorDireccionBloc>()
        .add(EventBotonObtenerDireccion(idUsuario: comprador!.idComprador));
    // ignore: use_build_context_synchronously
  }

  Center mensageNoDirecciones(BuildContext context, String idUsuario) {
    return (comprador != null)
        ? Center(
            child: InkWell(
              onTap: () {
                Route route = MaterialPageRoute(
                  builder: (context) =>
                      CompradorNuevaDireccionPage(idUsuario: idUsuario),
                );
                Navigator.push(context, route);
              },
              child: Text(
                "${comprador!.nombre.toUpperCase()}, tienes que tener direcciones agregadas, presiona este mensaje para agregar una direccion ahora",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        : const Center();
  }
}
