import 'package:arte_mex/caracteristicas/comprador/pago/presentation/page/comprador_pago_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CompradorCardDetalleProducto extends StatefulWidget {
  final double ancho;
  final double alto;
  final int cantidadProducto;
  const CompradorCardDetalleProducto(
      {super.key,
      required this.ancho,
      required this.alto,
      required this.cantidadProducto});

  @override
  State<CompradorCardDetalleProducto> createState() =>
      _CompradorCardDetalleProductoState();
}

class _CompradorCardDetalleProductoState
    extends State<CompradorCardDetalleProducto> {
  //
  List<String> cantidad = [];
  List<DropdownMenuItem<String>> dropDownMenuItems = [];
  String dropdownValue = "";
  //
  @override
  void initState() {
    cantidad = List.generate(
        widget.cantidadProducto, (index) => (index + 1).toString());
    dropDownMenuItems = getDropDownMenuItems();
    dropdownValue = dropDownMenuItems[0].value!;

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
      dropdownValue = selectedCity!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ancho = widget.ancho;
    final alto = widget.alto;
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  "assets/local_imagenes/zapatilla.jpg",
                  fit: BoxFit.cover,
                ),
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
                  "500.00",
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
                          value: dropdownValue,
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
                    onTap: () {},
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
                        builder: (context) => const CompradorPagoPage(),
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
                    "Este producto esta hecho 100 % natural y elavorado por manos artesanales",
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
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
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
}
