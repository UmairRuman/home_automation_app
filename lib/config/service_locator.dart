import 'package:get_it/get_it.dart';
import 'package:home_automation_app/core/services/user_management_service.dart';
import 'package:home_automation_app/core/services/user_profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

void setupLocator() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(
    () => sharedPreferences,
  );
  serviceLocator.registerSingleton(UserManagementService());
  serviceLocator.registerSingleton(UserProfileService());
}
