// ignore_for_file: use_build_context_synchronously

import 'package:arte_mex/alertas/alertas.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/domain/entities/carro.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';

import '../../bloc/comprador_carrito_bloc.dart';

class CompradorCarro extends StatefulWidget {
  final double ancho;
  final double alto;
  final Carro carro;
  final Comprador comprador;
  const CompradorCarro(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.carro,
      required this.comprador});

  @override
  State<CompradorCarro> createState() => _CompradorCarroState();
}

class _CompradorCarroState extends State<CompradorCarro> {
  @override
  Widget build(BuildContext context) {
    final ancho = widget.ancho;
    final alto = widget.alto;
    Carro carro = widget.carro;
    Comprador comprador = widget.comprador;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: ancho,
        height: alto / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffD9D9D9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: ancho / 3,
                height: alto / 6,
                color: Colors.amber,
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        )),
                  ),
                  imageUrl: carro.image,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          'assets/imagenes_iconos_card/tienda.svg',
                          width: 10,
                        ),
                      ),
                      SizedBox(
                        width: ancho / 3.4,
                        child: Text(
                          carro.nombreEmpresa,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(
                          'assets/imagenes_iconos_card/verificado.svg',
                          width: 10,
                          colorFilter: const ColorFilter.mode(
                              Color(0XFF1D9BF0), BlendMode.srcIn),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          'assets/imagenes_iconos_card/ubicacion.svg',
                          width: 10,
                        ),
                      ),
                      SizedBox(
                        width: ancho / 3.4,
                        child: Text(
                          carro.estado,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      width: ancho / 3.4,
                      child: Text(
                        carro.descripcionProducto,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          'Cantidad: ',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          carro.cantidad,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          'Tipo de envio: ',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 8,
                          ),
                        ),
                        Text(
                          "Normal",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4, top: 2),
                        child: SvgPicture.asset(
                          'assets/imagenes_iconos_card/precio.svg',
                          width: 10,
                        ),
                      ),
                      Text(
                        '${carro.precio}.00',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: ancho / 9,
              height: alto / 4,
              child: Stack(
                children: [
                  Positioned(
                    top: -12,
                    right: -13,
                    child: IconButton(
                      onPressed: () async {
                        if (await eliminarArticuloCarro(carro.idCarro)) {
                          context.read<CompradorCarritoBloc>().add(
                              EventBotonObtenerCarro(
                                  idUsuario: comprador.idComprador));
                        } else {
                          showAlertaVistaInicio(context, QuickAlertType.error,
                              "Error", "No se pudo eliminar el articulo");
                        }
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.purple,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> eliminarArticuloCarro(String id) async {
    try {
      return await context.read<CompradorCarritoBloc>().eliminarCarro(id);
    } catch (e) {
      return false;
    }
  }
}
