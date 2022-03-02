import 'package:andrews_app/features/search_verses_voice/presentation/search_verse_page.dart';
import 'package:flutter/cupertino.dart';

class RoutesController {
  static final Map<Routes, WidgetBuilder> _routes = {
    Routes.main : (_) => SearchVersePage()
  };

  static Map<String, WidgetBuilder> get routes {
    Map<String, WidgetBuilder> routes = {};
    for (var route in Routes.values) {
      final aux = _routes[route];
      if (aux != null) {
        routes[route.tag] = aux;
      }
    }
    return routes;
  }
}


enum Routes {
  main
}

extension Tag on Routes {
  String get tag {
    var route = "/";
    switch (this) {
      case Routes.main:
        route += '/main';
        break;
    }
    return route;
  }
}