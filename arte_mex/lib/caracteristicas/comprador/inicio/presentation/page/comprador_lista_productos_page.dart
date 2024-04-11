import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/widgets/comprador_card_producto.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/comprador_inicio_bloc.dart';

class CompradorListaProductosPage extends StatefulWidget {
  final String categoria;
  const CompradorListaProductosPage({super.key, required this.categoria});

  @override
  State<CompradorListaProductosPage> createState() =>
      _CompradorListaProductosPageState();
}

class _CompradorListaProductosPageState
    extends State<CompradorListaProductosPage> {
  @override
  void initState() {
    obtenerProductosCategoria(context, widget.categoria);
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
              titulo: "Productos",
              regresar: true,
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<CompradorInicioBloc>().add(
                EventBotonObtenerProductosCategorias(
                    categoria: widget.categoria));
          },
          child: SizedBox(
              width: double.infinity,
              height: double.maxFinite,
              child: BlocBuilder<CompradorInicioBloc, CompradorInicioState>(
                builder: (context, state) {
                  if (state is CompradorInicioObteniendoArticulosState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CompradorInicioArticulosObtenidosState) {
                    return (state.productos.isNotEmpty)
                        ? ListView.builder(
                            itemCount: state.productos.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CompradorCardProducto(
                                    alto: alto,
                                    ancho: ancho,
                                    producto: state.productos[index],
                                  ),
                                ],
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                                "No hay ningun producto en esta categaria"),
                          );
                  } else if (state is CompradorInicioErrorState) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return const Center(
                      child: Text("data"),
                    );
                  }
                },
              )),
        ));
  }

  void obtenerProductosCategoria(BuildContext context, String categoria) async {
    // ignore: use_build_context_synchronously
    context
        .read<CompradorInicioBloc>()
        .add(EventBotonObtenerProductosCategorias(categoria: categoria));
    // ignore: use_build_context_synchronously
  }
}
