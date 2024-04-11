import 'package:arte_mex/alertas/alertas.dart';
import 'package:arte_mex/caracteristicas/comprador/buscar/presentation/bloc/comprador_buscar_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/buscar/presentation/page/widget/card_producto.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';

class CompradorBusquedaPage extends StatefulWidget {
  const CompradorBusquedaPage({super.key});

  @override
  State<CompradorBusquedaPage> createState() => _CompradorBusquedaPageState();
}

class _CompradorBusquedaPageState extends State<CompradorBusquedaPage> {
  @override
  void initState() {
    reiniciarEvento();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controllerBusqueda = TextEditingController();
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          ReutilizableWidgetAppbar(
            ancho: ancho,
            alto: alto,
            titulo: "Búsqueda",
            regresar: false,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: ancho,
                height: alto / 12,
                decoration: BoxDecoration(
                  color: const Color(0xffE2E2E2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: ancho / 1.3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: controllerBusqueda,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Florero',
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 204, 204, 204),
                                fontSize: 10,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ancho / 6,
                      child: IconButton(
                        onPressed: () async {
                          if (controllerBusqueda.text.isNotEmpty) {
                            obtenerBusqueda(controllerBusqueda.text);
                          } else {
                            showAlertaVistaInicio(
                                context,
                                QuickAlertType.info,
                                "Campo vacio",
                                "Ncesitas escribir un articulo para buscar");
                          }
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 204, 204, 204),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: ancho,
              height: alto / 1.45,
              child: BlocBuilder<CompradorBuscarBloc, CompradorBuscarState>(
                builder: (context, state) {
                  if (state is CompradorObteniendoBuscarState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CompradorBusquedaObtenidaState) {
                    return (state.producto.isNotEmpty)
                        ? ListView.builder(
                            itemCount: state.producto.length,
                            itemBuilder: (context, index) {
                              return CardProducto(
                                ancho: ancho,
                                alto: alto,
                                producto: state.producto[index],
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              "No hay nada que coincida con ${controllerBusqueda.text} por ahora 😔",
                              textAlign: TextAlign.center,
                            ),
                          );
                  } else if (state is CompradorBusquedaErrorState) {
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

  Future<void> obtenerBusqueda(String criterio) async {
    try {
      context
          .read<CompradorBuscarBloc>()
          .add(EventBotonBuscar(criterio: criterio));
    } catch (e) {
      rethrow;
    }
  }

  void reiniciarEvento() async {
    try {
      context.read<CompradorBuscarBloc>().add(EvenBotonReiniciar());
    } catch (e) {
      rethrow;
    }
  }
}
