import 'package:arte_mex/caracteristicas/comprador/carrito/presentation/pages/comprador_carro_compra_page.dart';
import 'package:arte_mex/caracteristicas/comprador/historial/presentation/page/comprador_historial_compra.dart';
import 'package:arte_mex/caracteristicas/comprador/seguimiento/presentation/pages/comprador_seguimiento_page.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets_reutilizables/reutilizable_widget_perfil_page.dart';
import '../../../direcciones/presentation/page/comprador_direcciones_page.dart';

class CompradorPerfilPage extends StatefulWidget {
  const CompradorPerfilPage({super.key});

  @override
  State<CompradorPerfilPage> createState() => _CompradorPerfilPageState();
}

class _CompradorPerfilPageState extends State<CompradorPerfilPage> {
  final List<String> titulos = [
    "Historial",
    "Seguimiento",
    "Carrito",
    "Direcciones"
  ];
  final List<Widget> vistas = const [
    CompradorHistorialCompraPage(),
    CompradorSeguimientoPage(),
    CompradorCarroCompraPage(),
    CompradorDireccionesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return ReutilizableWidgetPerfil(
      titulos: titulos,
      vistas: vistas,
      usuario: false,
    );
  }
}
