import 'package:arte_mex/caracteristicas/comprador/inicio/presentation/page/inicio_page.dart';
import 'package:flutter/material.dart';

class RouterNavbarComprador extends StatelessWidget {
  final int index;
  const RouterNavbarComprador({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    List<Widget> paginas = [const InicioPage()];
    return paginas[index];
  }
}
