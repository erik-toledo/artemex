import 'package:arte_mex/caracteristicas/comerciante/pedidos/presentation/bloc/comerciante_pedidos_bloc.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/presentation/page/widgets/comerciante_card_pedidos_page.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utilidad/obtener_perfil_usuario.dart';
import '../../../../../widgets_reutilizables/reutilizable_widget_Appbar.dart';

class ComerciantePedidosPage extends StatefulWidget {
  const ComerciantePedidosPage({super.key});

  @override
  State<ComerciantePedidosPage> createState() => _ComerciantePedidosPageState();
}

class _ComerciantePedidosPageState extends State<ComerciantePedidosPage> {
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
            titulo: 'Pedidos',
            regresar: true,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: alto / 40),
          RefreshIndicator(
            onRefresh: () async {
              context.read<ComerciantePedidosBloc>().add(
                  EventBotonObtenerPedidos(idUsuario: comerciante!.idVendedor));
            },
            child: SizedBox(
              width: ancho,
              height: alto / 1.2,
              child:
                  BlocBuilder<ComerciantePedidosBloc, ComerciantePedidosState>(
                builder: (context, state) {
                  if (state is ComercianteObteniendoPedidosState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                    );
                  } else if (state is ComerciantePedidosObtenidosState) {
                    return (state.pedidos.isNotEmpty)
                        ? ListView.builder(
                            itemCount: state.pedidos.length,
                            itemBuilder: (context, index) {
                              return ComercianteCardPedidosPage(
                                ancho: ancho,
                                alto: alto,
                                pedido: state.pedidos[index],
                                idComerciante: (comerciante != null)
                                    ? comerciante!.idVendedor
                                    : "0",
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              "Sin pedidos por ahora",
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                  } else if (state is ComercianteErrorPedidosState) {
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

    if (comerciante != null) {
      // ignore: use_build_context_synchronously
      context
          .read<ComerciantePedidosBloc>()
          .add(EventBotonObtenerPedidos(idUsuario: comerciante!.idVendedor));
    }
  }
}
