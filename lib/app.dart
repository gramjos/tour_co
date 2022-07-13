// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_nullable_for_final_variable_declarations

import 'package:flutter/material.dart';
import 'screens/locations/locations.dart';
import 'screens/location_detail/location_detail.dart';
import 'style.dart';

const LocationRoute = '/';
const LocationDetailRoute = '/location_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic>? arguments =
          settings.arguments as Map<String, dynamic>?;
      Widget screen;
      switch (settings.name) {
        case LocationRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocationDetail(arguments!['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(titleTextStyle: AppBarTextStyle),
        textTheme: TextTheme(
          headline1: TitleTextStyle,
          bodyText1: Body1TextStyle,
        ));
  }
}
