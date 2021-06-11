import 'package:flutter/material.dart';
import 'package:shorten_url/ui/views/history/history_screen.dart';

import 'ui/shared/routes.dart';
import 'ui/views/home/home_screen.dart';
import 'ui/views/shorten/shorten_screen.dart';
import 'ui/views/splash/splash_screen.dart';

const String initialRoute = 'Splash Screen';

class AppRouter {
  static dynamic routes() => {
        RoutePaths.initialRoute: (BuildContext context) => SplashScreen(),
        RoutePaths.homeScreen: (BuildContext context) => HomeScreen(),
        RoutePaths.shortenScreen: (BuildContext context) => ShortenScreen(),
        RoutePaths.historyScreen: (BuildContext context) => HistoryScreen(),
      };
}
