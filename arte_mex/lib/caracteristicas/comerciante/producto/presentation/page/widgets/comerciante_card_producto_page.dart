// ignore_for_file: deprecated_member_use
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/presentation/bloc/comerciante_producto_bloc.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/presentation/page/comerciante_registro_producto_page.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../comprador/inicio/domain/entities/categoria.dart';

class ComercianteCardProductoPage extends StatefulWidget {
  final double ancho;
  final double alto;
  final ObtenerProducto producto;
  final Comerciante comerciante;
  final List<Categoria> categorias;
  const ComercianteCardProductoPage(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.producto,
      required this.comerciante,
      required this.categorias});

  @override
  State<ComercianteCardProductoPage> createState() =>
      _ComercianteCardProductoPageState();
}

class _ComercianteCardProductoPageState
    extends State<ComercianteCardProductoPage> {
  @override
  Widget build(BuildContext context) {
    ObtenerProducto productoObtenido = widget.producto;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
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
                          color: Colors.black,
                          width: 12,
                        ),
                        SizedBox(
                          width: widget.ancho / 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              widget.comerciante.nombreEmpresa,
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
                            color: const Color.fromRGBO(29, 155, 240, 1),
                            width: 10,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/imagenes_iconos_card/ubicacion.svg',
                          color: Colors.black,
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Text(
                            'Cantidad',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Text(
                            productoObtenido.cantidad,
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
                        SvgPicture.asset(
                          'assets/imagenes_iconos_card/precio.svg',
                          width: 13,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            "${productoObtenido.precio}.00",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    )
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
                SizedBox(height: widget.alto / 50),
                InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(
                      builder: (context) => ComercianteRegistroProductoPage(
                        id: widget.comerciante.idVendedor,
                        categorias: widget.categorias,
                        obtenerProducto: productoObtenido,
                      ),
                    );
                    Navigator.push(context, route);
                  },
                  child: SvgPicture.asset(
                    'assets/imagenes_iconos_card/editar.svg',
                    width: 19,
                    color: const Color.fromRGBO(255, 186, 0, 1),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
