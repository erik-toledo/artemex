import 'package:arte_mex/caracteristicas/comprador/comprar/domain/usecases/comprador_compra_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comprador_compra_event.dart';
part 'comprador_compra_state.dart';

class CompradorCompraBloc
    extends Bloc<CompradorCompraEvent, CompradorCompraState> {
  final CompradorCompraUsecase compraUsecase;

  Future<bool> crearCompra(String idUsuario, String direccion) async {
    try {
      return await compraUsecase.execute(idUsuario, direccion);
    } catch (e) {
      rethrow;
    }
  }

  CompradorCompraBloc({required this.compraUsecase})
      : super(CompradorCompraInicialState()) {
    on<CompradorCompraEvent>(
      (event, emit) {},
    );
  }
}
