import 'package:arte_mex/caracteristicas/comerciante/historial/presentation/bloc/comerciante_historial_bloc.dart';
import 'package:arte_mex/caracteristicas/comerciante/historial/presentation/bloc/comerciante_historial_event.dart';
import 'package:arte_mex/caracteristicas/comerciante/historial/presentation/bloc/comerciante_historial_state.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utilidad/obtener_perfil_usuario.dart';
import '../../../../../widgets_reutilizables/reutilizable_widget_Appbar.dart';
import 'comerciante_card_historial_page.dart';

class ComercianteHistorialPage extends StatefulWidget {
  const ComercianteHistorialPage({super.key});

  @override
  State<ComercianteHistorialPage> createState() =>
      _ComercianteHistorialPageState();
}

class _ComercianteHistorialPageState extends State<ComercianteHistorialPage> {
  @override
  void initState() {
    obtenerPerfil(context);
    super.initState();
  }

  Comerciante? comerciante;
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
            titulo: 'Historial de ventas',
            regresar: true,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: ancho,
            height: alto / 1.2,
            child: BlocBuilder<ComercianteHistorialBloc,
                ComercianteHistorialState>(
              builder: (context, state) {
                if (state is ComercianteObteniendoHistorialState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  );
                } else if (state is ComercianteHistorialObtenidoState) {
                  return (state.historial.isNotEmpty)
                      ? ListView.builder(
                          itemCount: state.historial.length,
                          itemBuilder: (context, index) {
                            return ComercianteCardHistorialPage(
                              ancho: ancho,
                              alto: alto,
                              compradorHistorialCompra: state.historial[index],
                            );
                          },
                        )
                      : Center(
                          child: Text(
                          "Vacio por ahora",
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w500,
                          ),
                        ));
                } else if (state is ComercianteHistorialErrorState) {
                  return Center(
                    child: Text(state.error),
                  );
                } else {
                  return const Center(
                    child: Text("No data"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void obtenerPerfil(BuildContext context) async {
    Object response = await obtenerPerfilUsuario(context);
    if (response is Comerciante) {
      setState(() {
        comerciante = response;
      });
    }
    // ignore: use_build_context_synchronously
    context.read<ComercianteHistorialBloc>().add(
        EventBotonObtenerHistorial(idComerciante: comerciante!.idVendedor));
  }
}
