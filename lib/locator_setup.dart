import 'package:get_it/get_it.dart';

import 'core/services/api/shorten_api.dart';
import 'core/services/navigation/navigation_service.dart';
import 'core/services/navigation/navigation_service_impl.dart';

GetIt locator = GetIt.instance;

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.
Future<void> setupLocator() async {
  //Api
  locator.registerLazySingleton<ShortenApi>(() => ShortenApi());
  // Services
  locator
      .registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
}
