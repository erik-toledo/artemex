import 'package:arte_mex/caracteristicas/comprador/seguimiento/presentation/bloc/comprador_seguimiento_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/seguimiento/presentation/pages/widgets/comprador_card_seguimiento.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utilidad/obtener_perfil_usuario.dart';

class CompradorSeguimientoPage extends StatefulWidget {
  const CompradorSeguimientoPage({super.key});

  @override
  State<CompradorSeguimientoPage> createState() =>
      _CompradorSeguimientoPageState();
}

class _CompradorSeguimientoPageState extends State<CompradorSeguimientoPage> {
  Comprador? comprador;
  BoxDecoration decoracion = BoxDecoration(
    color: const Color(0XFFE2E2E2),
    borderRadius: BorderRadius.circular(10),
    boxShadow: const <BoxShadow>[
      BoxShadow(
        offset: Offset(0, 4),
        blurRadius: 10,
        spreadRadius: 2,
        color: Color.fromRGBO(0, 0, 0, 0.263),
      )
    ],
  );
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
            titulo: "Seguimiento",
            regresar: true,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ancho / 1.1,
              height: alto / 1.5,
              child: BlocBuilder<CompradorSeguimientoBloc,
                  CompradorSeguimientoState>(
                builder: (context, state) {
                  if (state is CompradorObteniendoSeguimientoState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CompradorSeguimientoObtenidoState) {
                    return (state.seguimiento.isNotEmpty)
                        ? CarouselSlider(
                            items: state.seguimiento.map((compra) {
                              return CompradorCardSeguimiento(
                                ancho: ancho,
                                alto: alto,
                                compra: compra,
                                decoracion: decoracion,
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: alto / 1.5,
                              viewportFraction: 1,
                              autoPlay: false,
                              autoPlayCurve: Curves.linear,
                            ),
                          )
                        : const Center(
                            child: Text("Sin compras"),
                          );
                  } else if (state is CompradorSeguimientoError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return const Center();
                  }
                },
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
    debugPrint(comprador!.idComprador);
    // ignore: use_build_context_synchronously
    context
        .read<CompradorSeguimientoBloc>()
        .add(EventBotonObtenerSeguimiento(idUsuario: comprador!.idComprador));
  }
}
