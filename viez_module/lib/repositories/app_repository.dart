import 'package:viez_module/services/remote/api_service.dart';

class AppRepository {
  const AppRepository({
    required this.apiService,
  });

  final ApiService apiService;

  Future<String> getNumberTrivia() async {
    return apiService.getNumberTrivia();
  }
}