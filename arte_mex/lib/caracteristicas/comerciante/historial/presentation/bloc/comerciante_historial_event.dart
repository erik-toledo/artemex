abstract class ComercianteHistorialEvent {}

class EventBotonObtenerHistorial extends ComercianteHistorialEvent {
  final String idComerciante;
  EventBotonObtenerHistorial({required this.idComerciante});
}
