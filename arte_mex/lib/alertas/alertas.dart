import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void showAlerta(
    BuildContext context, QuickAlertType tipo, String titulo, String mensage) {
  QuickAlert.show(
    context: context,
    type: tipo,
    confirmBtnText: "Aceptar",
    cancelBtnText: "Cancelar",
    title: titulo,
    text: mensage,
    onConfirmBtnTap: () {
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );
}

void showAlertaError(
    BuildContext context, QuickAlertType tipo, String titulo, String mensage) {
  QuickAlert.show(
    context: context,
    type: tipo,
    confirmBtnText: "Aceptar",
    cancelBtnText: "Cancelar",
    title: titulo,
    text: mensage,
    onConfirmBtnTap: () {
      Navigator.pop(context);
    },
  );
}

void showAlertaVistaInicio(
    BuildContext context, QuickAlertType tipo, String titulo, String mensage) {
  QuickAlert.show(
    context: context,
    type: tipo,
    confirmBtnText: "Aceptar",
    cancelBtnText: "Cancelar",
    title: titulo,
    text: mensage,
    onConfirmBtnTap: () {
      Navigator.pop(context);
    },
  );
}
