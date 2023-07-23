import 'package:arte_mex/caracteristicas/comprador/buscar/presentation/page/comprador_busqueda_page.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/comprador_inicio_page.dart';
import 'package:arte_mex/caracteristicas/comprador/perfil/presentation/pages/comprador_perfil_page.dart';
import 'package:flutter/material.dart';

class RouterNavbarComprador extends StatelessWidget {
  final int index;
  const RouterNavbarComprador({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    List<Widget> paginas = const [
      CompradorBusquedaPage(),
      CompradorInicioPage(),
      CompradorPerfilPage()
    ];
    return paginas[index];
  }
}
