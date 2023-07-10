// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavbarComprador extends StatefulWidget {
  final Function currentIndex;
  const NavbarComprador({super.key, required this.currentIndex});

  @override
  State<NavbarComprador> createState() => _NavbarCompradorState();
}

class _NavbarCompradorState extends State<NavbarComprador> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: (int i) {
        setState(() {});
        index = i;
        widget.currentIndex(i);
      },
      backgroundColor: const Color.fromRGBO(255, 191, 53, 1),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/imagenes_iconos_navbar/buscar.svg',
              color: (index == 0)
                  ? const Color.fromRGBO(144, 13, 211, 1)
                  : Colors.white,
              width: 20,
              height: 20,
            ),
            label: ''),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/imagenes_iconos_navbar/inicio.svg',
            color: (index == 1)
                ? const Color.fromRGBO(144, 13, 211, 1)
                : Colors.white,
            width: 20,
            height: 20,
          ),
          label: 'Mis publicaciones',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/imagenes_iconos_navbar/perfil.svg',
            color: (index == 2)
                ? const Color.fromRGBO(144, 13, 211, 1)
                : Colors.white,
            width: 20,
            height: 20,
          ),
          label: 'Perfil',
        )
      ],
    );
  }
}
