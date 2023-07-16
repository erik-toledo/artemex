import 'package:arte_mex/caracteristicas/comerciante/historial/presentation/page/comerciante_historial_page.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/presentation/page/comerciante_pedidos_page.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/presentation/page/comerciante_estatus_productos.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/presentation/page/comerciante_productos_registrados_page.dart';
import 'package:arte_mex/widgets_reutilizables/reutilizable_widget_perfil_page.dart';
import 'package:flutter/material.dart';

class ComerciantePerfilPage extends StatefulWidget {
  const ComerciantePerfilPage({super.key});

  @override
  State<ComerciantePerfilPage> createState() => _ComerciantePerfilPageState();
}

class _ComerciantePerfilPageState extends State<ComerciantePerfilPage> {
  final List<String> titulos = [
    "Historial",
    "Productos",
    "Registro",
    "Pedidos"
  ];
  final List<Widget> vistas = const [
    ComercianteHistorialPage(),
    ComercianteEstatusProductos(),
    ComercianteProductosRegistradosPage(),
    ComerciantePedidosPage()
  ];
  @override
  Widget build(BuildContext context) {
    return ReutilizableWidgetPerfil(
      titulos: titulos,
      vistas: vistas,
      usuario: true,
    );
  }
}
