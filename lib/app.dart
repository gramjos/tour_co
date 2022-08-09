import 'package:flutter/material.dart';
import 'screens/locations/locations.dart';
import 'screens/location_detail/location_detail.dart';
import 'screens/home/start_page.dart';
import 'style.dart';

const String hom = '/';
const String locationRoute = '/locations';
const String locationDetailRoute = '/locations/location_detail';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        case hom:
          screen = StartPage();
          break;
        case locationRoute:
          screen = const Locations();
          break;
        case locationDetailRoute:
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
      appBarTheme: const AppBarTheme(titleTextStyle: appBarTextStyle),
      textTheme: const TextTheme(
        headline1: titleTextStyle,
        bodyText1: body1TextStyle,
      ),
    );
  }
}
