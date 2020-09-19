import 'package:finance_manager/models/storage.dart';
import 'package:finance_manager/models/user_controller.dart';
import 'package:get_it/get_it.dart';
import 'auth_repo.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthRepo>(AuthRepo());
  locator.registerSingleton<StorageRepo>(StorageRepo());
  locator.registerSingleton<UserController>(UserController());
}