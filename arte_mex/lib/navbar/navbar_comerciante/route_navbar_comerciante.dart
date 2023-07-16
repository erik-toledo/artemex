import 'package:arte_mex/caracteristicas/comerciante/inicio/presentation/page/comerciante_inicio_page.dart';
import 'package:arte_mex/caracteristicas/comerciante/perfil/presentation/page/comerciante_perfil_page.dart';
import 'package:arte_mex/caracteristicas/comerciante/verificacion/presentation/page/comerciante_verificacion_page.dart';
import 'package:flutter/material.dart';

class RouterNavbarComerciante extends StatelessWidget {
  final int index;
  const RouterNavbarComerciante({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    List<Widget> paginas = const [
      ComercianteVerificacionPage(),
      ComercianteInicioPage(),
      ComerciantePerfilPage(),
    ];
    return paginas[index];
  }
}
