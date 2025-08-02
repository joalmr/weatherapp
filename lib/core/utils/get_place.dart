import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> getPlaceName() async {
  try {
    // Obtener ubicación actual
    Position position = await Geolocator.getCurrentPosition();

    // Convertir coordenadas a nombre del lugar
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark lugar = placemarks[0];
      return "${lugar.locality}, ${lugar.country}";
    }

    return "Ubicación no encontrada";
  } catch (e) {
    return "Error: $e";
  }
}
