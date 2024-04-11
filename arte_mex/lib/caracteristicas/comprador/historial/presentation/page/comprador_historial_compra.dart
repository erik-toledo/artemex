import 'package:arte_mex/caracteristicas/comprador/historial/presentation/bloc/comprador_historial_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/historial/presentation/page/widget/comprador_card_compra.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utilidad/obtener_perfil_usuario.dart';

class CompradorHistorialCompraPage extends StatefulWidget {
  const CompradorHistorialCompraPage({super.key});

  @override
  State<CompradorHistorialCompraPage> createState() =>
      _CompradorHistorialCompraPageState();
}

class _CompradorHistorialCompraPageState
    extends State<CompradorHistorialCompraPage> {
  Comprador? comprador;
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
            titulo: 'Historial de compras',
            regresar: true,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ancho / 1.1,
              height: alto / 1.3,
              child:
                  BlocBuilder<CompradorHistorialBloc, CompradorHistorialState>(
                builder: (context, state) {
                  if (state is CompradorHistorialObteniendoHistorial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CompradorHistorialObtenidoState) {
                    return (state.historial.isNotEmpty)
                        ? ListView.builder(
                            itemCount: state.historial.length,
                            itemBuilder: (context, index) {
                              return CompradorCardCompra(
                                ancho: ancho,
                                alto: alto,
                                historialCompra: state.historial[index],
                              );
                            },
                          )
                        : const Center(child: Text("Sin historial"));
                  } else if (state is CompradorHistorialErrorState) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return const Center(
                      child: Text("Sin historial"),
                    );
                  }
                },
              ),
            ),
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
    context.read<CompradorHistorialBloc>().add(
        EventBotonCompradorObtenerHistorial(
            idComprador: comprador!.idComprador));
  }
}
