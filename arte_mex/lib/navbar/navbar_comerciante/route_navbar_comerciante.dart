

import 'package:arte_mex/caracteristicas/comerciante/perfil/presentation/page/comerciante_perfil_page.dart';
import 'package:flutter/material.dart';

class RouterNavbarComerciante extends StatelessWidget {
  final int index;
  const RouterNavbarComerciante({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    List<Widget> paginas = [const ComerciantePerfilPage()];
    return paginas[index];
  }
}
