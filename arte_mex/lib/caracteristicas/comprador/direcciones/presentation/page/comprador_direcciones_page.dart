import 'package:arte_mex/caracteristicas/comprador/direcciones/presentation/page/widgets/comprador_card_direccion.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utilidad/bloqueo_captura_pantalla.dart';
import '../../../../../utilidad/obtener_perfil_usuario.dart';
import '../../domain/entities/direccion.dart';
import '../bloc/comprador_direccion_bloc.dart';
import 'comprador_nueva_direccion_page.dart';

class CompradorDireccionesPage extends StatefulWidget {
  const CompradorDireccionesPage({super.key});

  @override
  State<CompradorDireccionesPage> createState() =>
      _CompradorDireccionesPageState();
}

class _CompradorDireccionesPageState extends State<CompradorDireccionesPage> {
  Comprador? comprador;
  @override
  void initState() {
    bloquearCapturaPantalla();
    obtenerPerfil(context);
    super.initState();
  }

  Direccion? direccion;
  int esIgual = -1;
  void cardSeleccionda(int index, List<Direccion> direcciones) {
    setState(() {
      direccion = direcciones[index];
      esIgual = index;
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
            titulo: 'Direcciones',
            regresar: true,
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CompradorDireccionBloc>().add(
              EventBotonObtenerDireccion(idUsuario: comprador!.idComprador));
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Direcciones registradas',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: ancho / 1.1,
                height: alto / 1.5,
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
                                  alto: alto,
                                  ancho: ancho,
                                  esSeleccionado: (esIgual == index),
                                  onTap: () =>
                                      cardSeleccionda(index, state.direcciones),
                                  direccion: state.direcciones[index],
                                  idUsuario: comprador!.idComprador,
                                );
                              },
                            )
                          : const Center(
                              child: Text("Sin direcciones que mostrar"),
                            );
                    } else if (state is CompradorDireccionErrorState) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else {
                      return const Center(
                        child: Text("No hay direcciones"),
                      );
                    }
                  },
                )),
            SizedBox(height: alto / 15),
            SizedBox(
              width: ancho / 1.1,
              height: alto / 14,
              child: ElevatedButton(
                onPressed: () {
                  if (comprador != null) {
                    Route route = MaterialPageRoute(
                      builder: (context) => CompradorNuevaDireccionPage(
                          idUsuario: comprador!.idComprador),
                    );
                    Navigator.push(context, route);
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child: Text(
                  'Nueva dirección',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
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
  }
}
