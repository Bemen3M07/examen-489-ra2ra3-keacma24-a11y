import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/car_model.dart';

/// Servei per consumir l'API de cotxes.
///
/// RA2.5 – Estableix connexions HTTP amb paquets de Flutter.
///
/// En mode local s'apunta al mock server Node.js (localhost:8080).
/// Per usar la API real de RapidAPI, canvia [_useMock] a false i
/// afegeix la teva clau a [_apiKey].
class CarHttpService {
  // ── Configuració ──────────────────────────────────────────────
  static const bool _useMock = true;

  // Mock local (node mock_server/server.js)
  static const String _mockBaseUrl = 'localhost:8080';

  // API real de RapidAPI
  static const String _realBaseUrl = 'cars-by-api-ninjas.p.rapidapi.com';
  static const String _apiKey = 'YOUR_API_KEY_HERE';

  static const Map<String, String> _realHeaders = {
    'x-rapidapi-host': _realBaseUrl,
    'x-rapidapi-key': _apiKey,
  };
  // ──────────────────────────────────────────────────────────────

  Uri _buildUri(String path, Map<String, String> queryParams) {
    if (_useMock) {
      return Uri.http(_mockBaseUrl, path, queryParams);
    }
    return Uri.https(_realBaseUrl, path, queryParams);
  }

  Map<String, String> get _headers => _useMock ? {} : _realHeaders;

  /// Retorna una primera pàgina de cotxes (versió sense paginació)
  Future<List<CarsModel>> getCars() async {
    final uri = _buildUri('/v1/cars', {'limit': '10'});
    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      final List<dynamic> decoded = json.decode(response.body) as List<dynamic>;
      return decoded
          .cast<Map<String, dynamic>>()
          .map((m) => CarsModel.fromMapToCarObject(m))
          .toList();
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  /// Retorna una pàgina de cotxes amb paginació (offset)
  ///
  /// [page] – número de pàgina (comença en 1)
  /// [limit] – elements per pàgina
  Future<List<CarsModel>> getCarsPage(int page, int limit) async {
    final offset = (page - 1) * limit;
    final uri = _buildUri('/v1/cars', {'limit': '$limit', 'offset': '$offset'});

    final response = await http
        .get(uri, headers: _headers)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return CarsModel.listFromJsonString(response.body);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }


  Future<List<CarsModel>> getCarsByFilter(String? make, String? model) async {
  final Map<String, String> queryParams = {};

  // Solo añadimos los parámetros si no son nulos ni están vacíos
  if (make != null && make.isNotEmpty) {
    queryParams['make'] = make;
  }
  if (model != null && model.isNotEmpty) {
    queryParams['model'] = model;
  }

  final url = _buildUri('/v1/cars/search', queryParams);

  try {
    final response = await http.get(url).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CarsModel.fromMapToCarObject(json)).toList();
    } else {
      throw Exception('Error en la búsqueda: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error de conexión o timeout: $e');
  }
}
}
