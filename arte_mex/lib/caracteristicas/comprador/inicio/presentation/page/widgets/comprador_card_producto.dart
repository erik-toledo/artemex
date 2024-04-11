import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/comprador_detalle_producto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CompradorCardProducto extends StatefulWidget {
  final double ancho;
  final double alto;
  final ObtenerProducto producto;
  const CompradorCardProducto({
    super.key,
    required this.ancho,
    required this.alto,
    required this.producto,
  });

  @override
  State<CompradorCardProducto> createState() => _CompradorCardProductoState();
}

class _CompradorCardProductoState extends State<CompradorCardProducto> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ancho = widget.ancho;
    final alto = widget.alto;
    ObtenerProducto producto = widget.producto;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () {
          Route route = MaterialPageRoute(
            builder: (context) => CompradorDetalleProducto(producto: producto),
          );
          Navigator.push(context, route);
        },
        child: Container(
          width: ancho,
          height: alto / 4,
          decoration: BoxDecoration(
            color: const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Container(
                  width: ancho / 3,
                  height: alto / 4,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
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
                    imageUrl: producto.image,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: alto / 4,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: SvgPicture.asset(
                                    "assets/imagenes_iconos_card/tienda.svg",
                                    width: 17,
                                  ),
                                ),
                                SizedBox(
                                  width: ancho / 3.2,
                                  child: Text(
                                    producto.nombreEmpresa,
                                    overflow: TextOverflow.visible,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 40),
                                  child: SvgPicture.asset(
                                    "assets/imagenes_iconos_card/verificado.svg",
                                    width: 15,
                                    colorFilter: const ColorFilter.mode(
                                        Color(0xff1D9BF0), BlendMode.srcIn),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: SvgPicture.asset(
                                    "assets/imagenes_iconos_card/ubicacion.svg",
                                    width: 17,
                                  ),
                                ),
                                SizedBox(
                                  width: ancho / 2.8,
                                  child: Text(
                                    producto.estado,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17),
                              child: SizedBox(
                                width: ancho / 2.8,
                                child: Text(
                                  producto.descripcionProducto,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17),
                              child: Row(
                                children: [
                                  Text(
                                    "Disponibilidad: ",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    producto.cantidad,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: SvgPicture.asset(
                                      "assets/imagenes_iconos_card/precio.svg",
                                      width: 17,
                                    ),
                                  ),
                                  Text(
                                    "${producto.precio}.00",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
