import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorten_url/router.dart';

import 'core/providers/links_history_provider.dart';
import 'core/services/navigation/navigation_service.dart';
import 'locator_setup.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LinksHistoryProvider(),
      child: MaterialApp(
        title: 'Shortly',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: navigationService.navigatorKey,
        initialRoute: initialRoute,
        routes: AppRouter.routes(),
      ),
    );
  }
}
