import 'package:flutter/material.dart';
import 'package:flutter_gummy/view/pages/detail_page.dart';
import 'package:flutter_gummy/view/pages/home_page.dart';

import '../core/constants/page_routes_constants.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case PageRoutes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case PageRoutes.detailPage:
        return MaterialPageRoute(builder: (_) => DetailPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
    }
  }
}