import 'package:arte_mex/alertas/alertas.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/presentation/bloc/comprador_direccion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

import '../../../domain/entities/direccion.dart';

class CompradorCardDireccion extends StatefulWidget {
  final double ancho;
  final double alto;
  final bool esSeleccionado;
  final Direccion direccion;
  final String idUsuario;
  final void Function()? onTap;
  const CompradorCardDireccion({
    super.key,
    required this.ancho,
    required this.alto,
    required this.esSeleccionado,
    required this.onTap,
    required this.direccion,
    required this.idUsuario,
  });

  @override
  State<CompradorCardDireccion> createState() => _CompradorCardDireccionState();
}

class _CompradorCardDireccionState extends State<CompradorCardDireccion> {
  @override
  Widget build(BuildContext context) {
    Direccion direccion = widget.direccion;
    String idComprador = widget.idUsuario;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: widget.ancho,
          height: widget.alto / 6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFFE4E3E3),
              border: (widget.esSeleccionado)
                  ? Border.all(color: Colors.purple)
                  : null),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: widget.ancho / 5,
                  height: widget.alto / 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFE4E3E3),
                  ),
                  child: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.purple,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: widget.ancho / 1.81,
                  height: widget.alto,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Estado: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            direccion.estado,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Municipio: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            direccion.municipio,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Calle: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          SizedBox(
                            width: widget.ancho / 2.5,
                            child: Text(
                              direccion.calle,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Num. Ext: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            direccion.numExterior,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          ),
                          SizedBox(width: widget.ancho / 30),
                          Text(
                            'Num. Int: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            direccion.numInterior,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Codigo postal: ',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            direccion.codigoPostal,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: widget.ancho / 11,
                    height: widget.alto / 20,
                    child: IconButton(
                      onPressed: () async {
                        bool response = await eliminarDireaccion(
                            context, direccion.idDireccion, idComprador);
                        if (!response) {
                          // ignore: use_build_context_synchronously
                          showAlertaError(context, QuickAlertType.error,
                              "Error", "La direccion no se pudo eliminar");
                        }
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.purple,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> eliminarDireaccion(
      BuildContext context, String idDireccion, String idComprador) async {
    try {
      bool respose = await context
          .read<CompradorDireccionBloc>()
          .eliminarDireccion(idDireccion);
      if (respose) {
        // ignore: use_build_context_synchronously
        context
            .read<CompradorDireccionBloc>()
            .add(EventBotonObtenerDireccion(idUsuario: idComprador));
      }
      return respose;
    } catch (e) {
      return false;
    }
  }
}
