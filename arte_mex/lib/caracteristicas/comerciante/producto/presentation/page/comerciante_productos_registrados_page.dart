// ignore_for_file: use_build_context_synchronously

import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/presentation/bloc/comerciante_producto_bloc.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/presentation/page/comerciante_registro_producto_page.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/utilidad/obtener_perfil_usuario.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:arte_mex/caracteristicas/comprador/inicio/domain/entities/categoria.dart';
import '../../../../comprador/inicio/presentation/bloc/comprador_inicio_bloc.dart';
import 'widgets/comerciante_card_producto_page.dart';

class ComercianteProductosRegistradosPage extends StatefulWidget {
  const ComercianteProductosRegistradosPage({super.key});

  @override
  State<ComercianteProductosRegistradosPage> createState() =>
      _ComercianteProductosRegistradosPageState();
}

class _ComercianteProductosRegistradosPageState
    extends State<ComercianteProductosRegistradosPage> {
  Comerciante? comerciante;
  ObtenerProducto? obtenerProducto;
  List<Categoria>? categorias;
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
            titulo: 'Productos registrados',
            regresar: true,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: alto / 40),
          RefreshIndicator(
            onRefresh: () async {
              context.read<ComercianteProductoBloc>().add(
                  EventBotonObtenerProducto(
                      idUsuario: comerciante!.idVendedor));
            },
            child: SizedBox(
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
                      return (comerciante != null &&
                              state.productos.isNotEmpty &&
                              categorias != null)
                          ? ListView.builder(
                              itemCount: state.productos.length,
                              itemBuilder: (context, index) {
                                return ComercianteCardProductoPage(
                                  ancho: ancho,
                                  alto: alto,
                                  producto: state.productos[index],
                                  comerciante: comerciante!,
                                  categorias: categorias!,
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                "Registra un producto ",
                                style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
          ),
          Padding(
            padding: EdgeInsets.only(top: (alto / 15), left: 13, right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: ancho / 2.2,
                  child: ElevatedButton(
                    onPressed: () {
                      if (categorias != null && comerciante != null) {
                        Route route = MaterialPageRoute(
                          builder: (context) => ComercianteRegistroProductoPage(
                            id: comerciante!.idVendedor.toString(),
                            categorias: categorias!,
                            obtenerProducto: obtenerProducto,
                          ),
                        );
                        Navigator.push(context, route);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromRGBO(5, 142, 247, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Agregar',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
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
      context
          .read<ComercianteProductoBloc>()
          .add(EventBotonObtenerProducto(idUsuario: comerciante!.idVendedor));

      List<Categoria> categoriasEnBloc =
          await context.read<CompradorInicioBloc>().obtenerCategorias();

      setState(() {
        categorias = categoriasEnBloc;
      });
    }
  }
}
