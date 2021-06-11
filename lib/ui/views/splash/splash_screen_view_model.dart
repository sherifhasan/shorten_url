import 'package:shorten_url/core/services/navigation/navigation_service.dart';
import 'package:shorten_url/ui/base/base_model.dart';
import 'package:shorten_url/ui/shared/routes.dart';

import '../../../locator_setup.dart';

class SplashScreenViewModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  void navigateToHome() {
    _navigationService.pushNamed(RoutePaths.homeScreen);
  }
}
