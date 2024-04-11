import 'package:arte_mex/alertas/alertas.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/domain/entities/carro.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/presentation/bloc/comprador_carrito_bloc.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/presentation/pages/comprador_carro_compra_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';

class CompradorCardDetalleProducto extends StatefulWidget {
  final double ancho;
  final double alto;
  final ObtenerProducto producto;
  final String idUsuario;
  const CompradorCardDetalleProducto({
    super.key,
    required this.ancho,
    required this.alto,
    required this.producto,
    required this.idUsuario,
  });

  @override
  State<CompradorCardDetalleProducto> createState() =>
      _CompradorCardDetalleProductoState();
}

class _CompradorCardDetalleProductoState
    extends State<CompradorCardDetalleProducto> {
  //
  List<String> cantidad = [];
  List<DropdownMenuItem<String>> dropDownMenuItems = [];
  String cantidadElegida = "";
  //
  @override
  void initState() {
    cantidad = List.generate(
        int.parse(widget.producto.cantidad), (index) => (index + 1).toString());
    dropDownMenuItems = getDropDownMenuItems();
    cantidadElegida = dropDownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String element in cantidad) {
      items.add(DropdownMenuItem(value: element, child: Text(element)));
    }
    return items;
  }

  void changedDropDownItem(String? selectedCity) {
    setState(() {
      cantidadElegida = selectedCity!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ancho = widget.ancho;
    final alto = widget.alto;
    final ObtenerProducto producto = widget.producto;
    String idUsuario = widget.idUsuario;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: ancho,
              height: alto / 1.55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
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
                imageUrl: producto.image,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "\u{0024}",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  "${producto.precio}.00",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      shadows: const [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 8,
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                        )
                      ]),
                ),
              ],
            ),
            Text(
              'Disponibilidad',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Container(
              width: ancho,
              height: alto / 15,
              decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      "Cantidad: ",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: ancho / 1.8,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: cantidadElegida,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: const Color(0xffDADADA),
                          items: dropDownMenuItems,
                          onChanged: changedDropDownItem,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      bool response = await agregarCarrito(idUsuario, producto);
                      if (response) {
                        // ignore: use_build_context_synchronously
                        showAlertaVistaInicio(context, QuickAlertType.success,
                            "Hecho", "Producto agregaso al carrito");
                      } else {
                        // ignore: use_build_context_synchronously
                        showAlertaError(context, QuickAlertType.error, "Error",
                            "No se pudo agregar el producto al carrito, intente mas tarde");
                      }
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/imagenes_iconos_comerciante/carrito.svg',
                          width: 30,
                          colorFilter: const ColorFilter.mode(
                            Colors.purple,
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          "Añadir al carrito",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                        builder: (context) => const CompradorCarroCompraPage(),
                      );
                      Navigator.push(context, route);
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/imagenes_iconos_card/paypal.svg',
                          width: 30,
                          colorFilter: const ColorFilter.mode(
                            Color(0xff00447B),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          "Comprar ahora",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xff0079C2),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(
              "Descripción",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Container(
              width: ancho,
              height: alto / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffEAEAEA),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    producto.descripcionProducto,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Detalles del proovedor",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            Container(
              width: ancho,
              height: alto / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffEAEAEA),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    producto.descripcionProveedor,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> agregarCarrito(String id, ObtenerProducto producto) async {
    bool response = false;
    if (int.parse(cantidadElegida) > 0 &&
        int.parse(cantidadElegida) <= int.parse(producto.cantidad)) {
      response = await context
          .read<CompradorCarritoBloc>()
          .agregarCarro(id, crearCarro(producto, id));

      debugPrint(id);
      // ignore: use_build_context_synchronously
      context
          .read<CompradorCarritoBloc>()
          .add(EventBotonObtenerCarro(idUsuario: id));
    }
    return response;
  }

  Carro crearCarro(ObtenerProducto producto, String idComprador) => Carro(
        idProducto: producto.idProducto,
        idCarro: "0",
        idComprador: idComprador,
        cantidad: cantidadElegida,
        nombreEmpresa: producto.nombreEmpresa,
        idVendedor: producto.idVendedor,
        nombreProducto: producto.nombreProducto,
        estado: producto.estado,
        precio: producto.precio,
        descripcionProducto: producto.descripcionProducto,
        descripcionProveedor: producto.descripcionProveedor,
        image: producto.image,
        estatus: "",
      );
}
