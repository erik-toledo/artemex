import 'package:arte_mex/caracteristicas/comprador/comprar/domain/entities/compra.dart';
import 'package:arte_mex/caracteristicas/comprador/seguimiento/presentation/pages/widgets/comprador_card_seguimiento.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CompradorSeguimientoPage extends StatefulWidget {
  const CompradorSeguimientoPage({super.key});

  @override
  State<CompradorSeguimientoPage> createState() =>
      _CompradorSeguimientoPageState();
}

class _CompradorSeguimientoPageState extends State<CompradorSeguimientoPage> {
  List<Compra> compras = [
    Compra(
      nombreEmpresa: "Artesanias Mex",
      nombreProducto: "Licor artesanal",
      cantidad: "2",
      descripcionProducto: "Licor artesanal",
      precio: "500",
      total: "1240",
      fechaCompra: "10/12/2023",
      estatusPago: "OK",
      estatusEntrega: "ENTREGADO",
      ubicacion: "Tuxtla Gtz",
      tipoEnvio: "NORMAL",
      idUsuario: "1",
      idEmpresa: "1",
      image: "assets/local_imagenes/zapatilla.jpg",
    )
  ];

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
            titulo: "Seguimiento",
            regresar: true,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: ancho / 1.1,
              height: alto / 1.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: 0,
                      color: Color.fromRGBO(0, 0, 0, 0.263),
                    )
                  ]),
              child: CarouselSlider(
                items: compras.map((compra) {
                  return CompradorCardSeguimiento(
                    ancho: ancho,
                    alto: alto,
                    compra: compra,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: alto / 1.5,
                  viewportFraction: 1,
                  autoPlay: false,
                  autoPlayCurve: Curves.linear,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
