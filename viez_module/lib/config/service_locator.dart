import 'package:get_it/get_it.dart';
import 'package:viez_api_testing/repositories/app_repository.dart';
import 'package:viez_api_testing/services/remote/api_service.dart';

final locator = GetIt.instance;

Future setupServiceLocator() async {
  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<AppRepository>(() => AppRepository(apiService:  ApiService()));
}