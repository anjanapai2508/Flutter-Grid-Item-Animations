import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home-view.dart';

const String HOME = '/';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => HomeView());
      break;
    default:
      return MaterialPageRoute(builder: (context) => HomeView());
  }
}
