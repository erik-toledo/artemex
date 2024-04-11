import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/comerciante_producto_bloc.dart';

class ComercianteCardEstatusProducto extends StatefulWidget {
  final double ancho;
  final double alto;
  final ObtenerProducto obtenerProducto;
  final Comerciante comerciante;
  const ComercianteCardEstatusProducto(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.obtenerProducto,
      required this.comerciante});

  @override
  State<ComercianteCardEstatusProducto> createState() =>
      _ComercianteCardEstatusProductoState();
}

class _ComercianteCardEstatusProductoState
    extends State<ComercianteCardEstatusProducto> {
  @override
  Widget build(BuildContext context) {
    ObtenerProducto productoObtenido = widget.obtenerProducto;
    Comerciante comerciante = widget.comerciante;
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15, top: 10),
      child: Container(
        width: widget.ancho / 1.3,
        height: widget.alto / 5,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 1),
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: widget.ancho / 2.5,
                height: widget.alto / 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
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
                  imageUrl: productoObtenido.image,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: widget.ancho / 2.5,
                height: widget.alto,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/imagenes_iconos_card/tienda.svg',
                          colorFilter: const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                          width: 12,
                        ),
                        SizedBox(
                          width: widget.ancho / 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              comerciante.nombreEmpresa,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1, bottom: 10),
                          child: SvgPicture.asset(
                            'assets/imagenes_iconos_card/verificado.svg',
                            colorFilter: const ColorFilter.mode(
                                Color.fromRGBO(29, 155, 240, 1),
                                BlendMode.srcIn),
                            width: 10,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/imagenes_iconos_card/ubicacion.svg',
                          colorFilter: const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                          width: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            productoObtenido.estado,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Text(
                            productoObtenido.nombreProducto,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        productoObtenido.estatus.toUpperCase(),
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: InkWell(
                    onTap: () async {
                      context.read<ComercianteProductoBloc>().add(
                            EventBotonEliminarProducto(
                                idProducto: productoObtenido.idProducto),
                          );
                      context.read<ComercianteProductoBloc>().add(
                          EventBotonObtenerProducto(
                              idUsuario: widget.comerciante.idVendedor));
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
