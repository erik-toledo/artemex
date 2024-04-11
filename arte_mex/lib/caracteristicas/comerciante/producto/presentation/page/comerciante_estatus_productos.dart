import 'package:arte_mex/caracteristicas/comerciante/producto/presentation/page/widgets/comerciante_card_estatus_producto.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utilidad/obtener_perfil_usuario.dart';
import '../bloc/comerciante_producto_bloc.dart';

class ComercianteEstatusProductos extends StatefulWidget {
  const ComercianteEstatusProductos({super.key});

  @override
  State<ComercianteEstatusProductos> createState() =>
      _ComercianteEstatusProductosState();
}

class _ComercianteEstatusProductosState
    extends State<ComercianteEstatusProductos> {
  Comerciante? comerciante;
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
            titulo: 'Estatus productos',
            regresar: true,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
              width: ancho,
              height: alto / 1.40,
              child: BlocBuilder<ComercianteProductoBloc,
                  ComercianteProductoState>(
                builder: (context, state) {
                  if (state is ComercianteCargandoState ||
                      state is ComercianteProductoEliminadoState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                    );
                  } else if (state is ComercianteProductoCargadoState) {
                    return (comerciante != null && state.productos.isNotEmpty)
                        ? ListView.builder(
                            itemCount: state.productos.length,
                            itemBuilder: (context, index) {
                              return ComercianteCardEstatusProducto(
                                  ancho: ancho,
                                  alto: alto,
                                  obtenerProducto: state.productos[index],
                                  comerciante: comerciante!);
                            },
                          )
                        : const Center(
                            child: Text("No tienes productos agregados"),
                          );
                  } else if (state is ComercianteProductoError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return Center(
                      child: Text((comerciante != null)
                          ? "Sin productos en el usuario ${comerciante!.idVendedor}"
                          : "No data"),
                    );
                  }
                },
              )),
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
    context
        .read<ComercianteProductoBloc>()
        .add(EventBotonObtenerProducto(idUsuario: comerciante!.idVendedor));
  }
}
