import 'package:injectable/injectable.dart';

@lazySingleton
class ApiConfig {
  final String baseUrl;

  ApiConfig(this.baseUrl);

  String get apiUrl => '$baseUrl/api';
}
