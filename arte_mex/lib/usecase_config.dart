import 'package:arte_mex/caracteristicas/comerciante/historial/data/datasource/comeciante_historial_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comerciante/historial/data/repositories/comerciante_historial_repository_impl.dart';
import 'package:arte_mex/caracteristicas/comerciante/historial/domain/usecase/comerciante_obtener_historial_venta_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/data/datasource/pedidos_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/data/repositories/pedidos_repository_impl.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/usecase/actualizar_estatus_pedido_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/usecase/obtener_pedidos_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/data/datasource/producto_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/data/repositories/producto_repository_impl.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/usecase/actualizar_producto_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/usecase/crear_producto_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/usecase/eliminar_producto_usecase.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/usecase/obtener_producto_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/buscar/data/datasource/comprador_busqueda_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/buscar/data/repositories/comprador_busqueda_repository_impl.dart';
import 'package:arte_mex/caracteristicas/comprador/buscar/domain/usecase/comprador_busqueda_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/data/datasource/comprador_carrito_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/data/repositories/comprador_carrito_repository_impl.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/domain/usecases/comprador_agregar_producto_carrito_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/domain/usecases/comprador_eliminar_producto_carrito_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/domain/usecases/comprador_obtener_carrito_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/comprar/data/datasource/comprador_compra_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/comprar/data/repositories/comprador_compra_repository_impl.dart';
import 'package:arte_mex/caracteristicas/comprador/comprar/domain/usecases/comprador_compra_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/data/datasource/comprador_direccion_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/data/repositories/comprador_direccion_repository_impl.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/usecases/comprador_actualizar_direccion_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/usecases/comprador_crear_direccion_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/usecases/comprador_eliminar_direccion_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/usecases/comprador_obtener_direccion_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/historial/data/datasource/comprador_historial_compra_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/historial/data/repositories/comprador_historial_compra_repository_impl.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/data/datasource/comprador_categoria_remote_data_sorce.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/data/repositories/comprador_categoria_repository_impl.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/usecase/comprador_obtener_categoria_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/usecase/comprador_obtener_categorias_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/usecase/comprador_obtener_estado_categoria_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/usecase/comprador_obtener_producto_categoria_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/usecase/comprador_obtener_producto_inicio_usecase.dart';
import 'package:arte_mex/caracteristicas/comprador/seguimiento/data/datasource/comprador_seguimiento_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/seguimiento/data/repositories/comprador_seguimiento_repository_impl.dart';
import 'package:arte_mex/caracteristicas/comprador/seguimiento/domain/usecases/comprador_seguimiento_usecase.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/data/datasource/inicio_sesion_local_data.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/data/datasource/inicio_sesion_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/data/repositories/inicio_sesion_local_informacion_repository_impl.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/data/repositories/inicio_sesion_repository_impl.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/usecases/iniciar_sesion_usecase.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/usecases/inicio_sesion_obtener_informacion_usuario.dart';
import 'package:arte_mex/caracteristicas/registro/data/datasource/registro_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/registro/data/repositories/registro_repository_impl.dart';
import 'package:arte_mex/caracteristicas/registro/domain/usecase/registro_crear_usuario_comerciante.dart';
import 'package:arte_mex/caracteristicas/registro/domain/usecase/registro_crear_usuario_comprador.dart';

import 'caracteristicas/comerciante/producto/domian/usecase/subir_imagen_usecase.dart';
import 'caracteristicas/comprador/historial/domain/usecase/comprador_obtener_historial_compra_usecase.dart';

class UsecaseConfig {
  //Inicio de sesion
  InicioSesionRemoteDataSourceImpl? inicioSesionRemoteDataSourceImpl;
  InicioSesionLocalDataImpl? inicioSesionLocalDataImpl;

  InicioSesionRepositoryImpl? inicioSesionRepositoryImpl;
  InicioSesionLocalInformacionRepositoryImpl? informacionRepositoryImpl;

  IniciarSesionUsecase? iniciarSesionUsecase;
  InicioSesionObtenerInformacionUsuarioUsecase?
      inicioSesionObtenerInformacionUsuarioUsecase;
  //Comerciante
  //Productos
  ProductoRemoteDataSourceImpl? productoRemoteDataSourceImpl;
  ProductoRepositoryImpl? productoRepositoryImpl;

  ActualizarProductoUsecase? actualizarProductoUsecase;
  CrearProductoUsecase? crearProductoUsecase;
  EliminarProductoUsecase? eliminarProductoUsecase;
  ObtenerProductoUsecase? obtenerProductoUsecase;
  SubirImagenUsecase? subirImagenUsecase;
  //Pedidos
  PedidosRemoteDataSourceImpl? pedidosRemoteDataSourceImpl;
  PedidosRepositoryImpl? pedidosRepositoryImpl;

  ObtenerPedidosUsecase? obtenerPedidosUsecase;
  ActualizarEstatusPedidoUsecase? actualizarEstatusPedidoUsecase;
  //Historial
  ComercianteHistorialRemoteDataSourceImpl?
      comercianteHistorialRemoteDataSourceImpl;
  ComercianteHistorialRepositoryImpl? comercianteHistorialRepositoryImpl;
  ComercianteObtenerHistorialVentaUsecase?
      comercianteObtenerHistorialVentaUsecase;

  //Comprador
  //inicio
  CompradorCategoriaRemoteDataSourceImpl? categoriaRemoteDataSourceImpl;
  CompradorCategoriaRepositoryImpl? categoriaRepositoryImpl;

  CompradorObtenerCategoriaUsecase? categoriaUsecase;
  CompradorObtenerProductoInicioUsecase? compradorObtenerProductoInicioUsecase;
  CompradorObtenerCategoriasUsecase? compradorObtenerCategoriasUsecase;
  CompradorObtenerPrudctoCategoriaInicioUsecase?
      compradorObtenerCategoriaInicioUsecase;
  CompradorObtenerEstadoCategoriaUsecase?
      compradorObtenerEstadoCategoriaUsecase;
  //Historial
  CompradorHistorialCompraRemoteDataSourceImpl? compraRemoteDataSourceImpl;
  CompradorHistorialCompraRepositoryImpl? compraRepositoryImpl;
  CompradorObtenerHistorialCompraUsecase? obtenerHistorialCompraUsecase;

  // Direccion
  CompradorDireccionRemoteDataSourceImpl?
      compradorDireccionRemoteDataSourceImpl;
  CompradorDireccionRepositoryImpl? compradorDireccionRepositoryImpl;
  CompradorActualizarDireccionUsecase? compradorActualizarDireccionUsecase;
  CompradorCrearDireccionUsecase? compradorCrearDireccionUsecase;
  CompradorEliminarDireccionUsecase? compradorEliminarDireccionUsecase;
  CompradorObtenerDireccionUsecase? compradorObtenerDireccionUsecase;

  //Compra
  CompradorCompraRemoteDataSourceImpl? compradorCompraRemoteDataSourceImpl;
  CompradorCompraRepositoryImpl? compradorCompraRepositoryImpl;
  CompradorCompraUsecase? compraUsecase;
  //Carrito
  CompradorCarritoRemoteDataSourceImpl? carritoRemoteDataSourceImpl;
  CompradorCarritoRepositoryImpl? compradorCarritoRepositoryImpl;
  CompradorAgregarProductoCarritoUsecase?
      compradorAgregarProductoCarritoUsecase;
  CompradorEliminarProductoCarritoUsecase?
      compradorEliminarProductoCarritoUsecase;
  CompradorObtenerCarritoUsecase? carritoUsecase;
  //Buscar
  CompradorBusquedaRemoteDataSourceImpl? compradorBusquedaRemoteDataSourceImpl;
  CompradorBusquedaRepositoryImpl? compradorBusquedaRepositoryImpl;
  CompradorBusquedaUsease? compradorBusquedaUsease;

  //Seguimiento
  CompradorSeguimientoRemoteDataSourceImpl?
      compradorSeguimientoRemoteDataSourceImpl;
  CompradorSeguimientoRepositoryImpl? compradorSeguimientoRepositoryImpl;
  CompradorSeguimientoUsecase? compradorSeguimientoUsecase;
  //Registro
  RegistroRemoteDataSourceImpl? registroRemoteDataSourceImpl;
  RegistroRepositoryImpl? registroRepositoryImpl;
  RegistroCrearUsuarioComerciante? registroCrearUsuarioComerciante;
  RegistroCrearUsuarioComprador? registroCrearUsuarioComprador;
  UsecaseConfig() {
    //Inicio sesion
    inicioSesionRemoteDataSourceImpl = InicioSesionRemoteDataSourceImpl();
    inicioSesionLocalDataImpl = InicioSesionLocalDataImpl();

    inicioSesionRepositoryImpl = InicioSesionRepositoryImpl(
        inicioSesionRemoteDataSource: inicioSesionRemoteDataSourceImpl!);
    informacionRepositoryImpl = InicioSesionLocalInformacionRepositoryImpl(
        localDataImpl: inicioSesionLocalDataImpl!);

    iniciarSesionUsecase = IniciarSesionUsecase(
        inicioSesionRepository: inicioSesionRepositoryImpl!);
    inicioSesionObtenerInformacionUsuarioUsecase =
        InicioSesionObtenerInformacionUsuarioUsecase(
            informacionRepository: informacionRepositoryImpl!);
    //Comerciante
    productoRemoteDataSourceImpl = ProductoRemoteDataSourceImpl();
    productoRepositoryImpl = ProductoRepositoryImpl(
        productoRemoteDataSource: productoRemoteDataSourceImpl!);

    actualizarProductoUsecase =
        ActualizarProductoUsecase(productoRepository: productoRepositoryImpl!);
    crearProductoUsecase =
        CrearProductoUsecase(productoRepository: productoRepositoryImpl!);
    eliminarProductoUsecase =
        EliminarProductoUsecase(productoRepository: productoRepositoryImpl!);
    obtenerProductoUsecase =
        ObtenerProductoUsecase(productoRepository: productoRepositoryImpl!);
    subirImagenUsecase =
        SubirImagenUsecase(productoRepository: productoRepositoryImpl!);

    //Pedido
    pedidosRemoteDataSourceImpl = PedidosRemoteDataSourceImpl();
    pedidosRepositoryImpl = PedidosRepositoryImpl(
        pedidosRemoteDataSource: pedidosRemoteDataSourceImpl!);
    obtenerPedidosUsecase =
        ObtenerPedidosUsecase(pedidosRepository: pedidosRepositoryImpl!);
    actualizarEstatusPedidoUsecase = ActualizarEstatusPedidoUsecase(
        pedidosRepository: pedidosRepositoryImpl!);

    //Historial
    comercianteHistorialRemoteDataSourceImpl =
        ComercianteHistorialRemoteDataSourceImpl();
    comercianteHistorialRepositoryImpl = ComercianteHistorialRepositoryImpl(
        comercianteHistorialRemoteDataSource:
            comercianteHistorialRemoteDataSourceImpl!);
    comercianteObtenerHistorialVentaUsecase =
        ComercianteObtenerHistorialVentaUsecase(
            comercianteHistorialRepository:
                comercianteHistorialRepositoryImpl!);

    //Comprador inicio
    categoriaRemoteDataSourceImpl = CompradorCategoriaRemoteDataSourceImpl();
    categoriaRepositoryImpl = CompradorCategoriaRepositoryImpl(
        categoriaRemoteDataSource: categoriaRemoteDataSourceImpl!);
    categoriaUsecase = CompradorObtenerCategoriaUsecase(
        categoriaRepository: categoriaRepositoryImpl!);
    compradorObtenerCategoriaInicioUsecase =
        CompradorObtenerPrudctoCategoriaInicioUsecase(
            categoriaRepository: categoriaRepositoryImpl!);
    compradorObtenerProductoInicioUsecase =
        CompradorObtenerProductoInicioUsecase(
            categoriaRepository: categoriaRepositoryImpl!);
    compradorObtenerCategoriasUsecase = CompradorObtenerCategoriasUsecase(
        categoriaRepository: categoriaRepositoryImpl!);
    compradorObtenerEstadoCategoriaUsecase =
        CompradorObtenerEstadoCategoriaUsecase(
            categoriaRepository: categoriaRepositoryImpl!);

    //Historial

    compraRemoteDataSourceImpl = CompradorHistorialCompraRemoteDataSourceImpl();
    compraRepositoryImpl = CompradorHistorialCompraRepositoryImpl(
        compraRepository: compraRemoteDataSourceImpl!);
    obtenerHistorialCompraUsecase = CompradorObtenerHistorialCompraUsecase(
        compradorHistorialCompraRepository: compraRepositoryImpl!);

    //Direccion
    compradorDireccionRemoteDataSourceImpl =
        CompradorDireccionRemoteDataSourceImpl();
    compradorDireccionRepositoryImpl = CompradorDireccionRepositoryImpl(
        compradorDireccionRemoteDataSource:
            compradorDireccionRemoteDataSourceImpl!);
    compradorActualizarDireccionUsecase = CompradorActualizarDireccionUsecase(
        compradorDireccionRepository: compradorDireccionRepositoryImpl!);
    compradorCrearDireccionUsecase = CompradorCrearDireccionUsecase(
        compradorDireccionRepository: compradorDireccionRepositoryImpl!);
    compradorEliminarDireccionUsecase = CompradorEliminarDireccionUsecase(
        compradorDireccionRepository: compradorDireccionRepositoryImpl!);
    compradorObtenerDireccionUsecase = CompradorObtenerDireccionUsecase(
        compradorDireccionRepository: compradorDireccionRepositoryImpl!);

    //Compra

    compradorCompraRemoteDataSourceImpl = CompradorCompraRemoteDataSourceImpl();
    compradorCompraRepositoryImpl = CompradorCompraRepositoryImpl(
        compraRemoteDataSource: compradorCompraRemoteDataSourceImpl!);
    compraUsecase = CompradorCompraUsecase(
        compradorCompraRepository: compradorCompraRepositoryImpl!);

    //Carrito
    carritoRemoteDataSourceImpl = CompradorCarritoRemoteDataSourceImpl();
    compradorCarritoRepositoryImpl = CompradorCarritoRepositoryImpl(
        carritoRemoteDataSource: carritoRemoteDataSourceImpl!);
    compradorAgregarProductoCarritoUsecase =
        CompradorAgregarProductoCarritoUsecase(
            compradorCarritoRepository: compradorCarritoRepositoryImpl!);
    compradorEliminarProductoCarritoUsecase =
        CompradorEliminarProductoCarritoUsecase(
            compradorCarritoRepository: compradorCarritoRepositoryImpl!);
    carritoUsecase = CompradorObtenerCarritoUsecase(
        compradorCarritoRepository: compradorCarritoRepositoryImpl!);

    //Busqueda
    compradorBusquedaRemoteDataSourceImpl =
        CompradorBusquedaRemoteDataSourceImpl();
    compradorBusquedaRepositoryImpl = CompradorBusquedaRepositoryImpl(
        compradorBusquedaRemoteDataSource:
            compradorBusquedaRemoteDataSourceImpl!);
    compradorBusquedaUsease = CompradorBusquedaUsease(
        compradorBusquedaRepository: compradorBusquedaRepositoryImpl!);
    //Seguimiento
    compradorSeguimientoRemoteDataSourceImpl =
        CompradorSeguimientoRemoteDataSourceImpl();
    compradorSeguimientoRepositoryImpl = CompradorSeguimientoRepositoryImpl(
        compradorSeguimientoRemoteDataSource:
            compradorSeguimientoRemoteDataSourceImpl!);
    compradorSeguimientoUsecase = CompradorSeguimientoUsecase(
        compradorSeguimientoRepository: compradorSeguimientoRepositoryImpl!);

    //Registro
    registroRemoteDataSourceImpl = RegistroRemoteDataSourceImpl();
    registroRepositoryImpl = RegistroRepositoryImpl(
        registroRemoteDataSource: registroRemoteDataSourceImpl!);
    registroCrearUsuarioComerciante = RegistroCrearUsuarioComerciante(
        registroRepository: registroRepositoryImpl!);
    registroCrearUsuarioComprador = RegistroCrearUsuarioComprador(
        registroRepository: registroRepositoryImpl!);
  }
}
