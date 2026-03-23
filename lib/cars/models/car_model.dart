import 'dart:convert';

/// Model de dades per representar un cotxe de l'API de RapidAPI
class CarsModel {
  final int id;
  final int year;
  final String make;
  final String model;
  final String type;
  final String city;
  final String color;

  CarsModel({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
    required this.type,
    required this.city,
    required this.color,
  });

  /// Converteix un Map (JSON) en un objecte CarsModel
  factory CarsModel.fromMapToCarObject(Map<String, dynamic> json) {
    return CarsModel(
      id: json['id'] as int,
      year: json['year'] is int
          ? json['year']
          : int.tryParse(json['year'].toString()) ?? 0,
      make: json['make'] as String? ?? '',
      model: json['model'] as String? ?? '',
      type: json['type'] as String? ?? '',
      city: json['city'] as String? ?? '',
      color: json['color'] as String? ?? '',
    );
  }

  /// Converteix una llista de Maps en una llista de CarsModel
  static List<CarsModel> listFromMaps(List<dynamic> list) {
    return list
        .cast<Map<String, dynamic>>()
        .map((m) => CarsModel.fromMapToCarObject(m))
        .toList();
  }

  /// Converteix un String JSON (llista) en una llista de CarsModel
  static List<CarsModel> listFromJsonString(String jsonString) {
    final List<dynamic> decoded = json.decode(jsonString) as List<dynamic>;
    return listFromMaps(decoded);
  }

  @override
  String toString() =>
      'CarsModel(id: $id, year: $year, make: $make, model: $model)';
}
