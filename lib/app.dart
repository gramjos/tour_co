import 'package:flutter/material.dart';
import 'package:tour_co/screens/resume/resume.dart';
import 'screens/tech_article_list/article_list.dart';
import 'screens/tech_article_list/article/location_detail.dart';
import 'screens/home/start_page.dart';
import 'screens/math_comp/para.dart';
import 'style.dart';

const String hom = '/';
const String homie = '/homie';
const String resumeRoute = '/resume';
const String matCompRoute = '/matComp';
const String artEgypt = '/egypt';
const String locationRoute = '/locations';
const String locationDetailRoute = '/locations/location_detail';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: _onRoutes,
      theme: _theme(),
    );
  }

  Route<dynamic> _onRoutes(RouteSettings settings) {
    final Map<String, dynamic>? arguments =
        settings.arguments as Map<String, dynamic>?;
    Widget screen;
    switch (settings.name) {
      case hom:
        // case homie:
        screen = StartPage();
        break;
      case locationRoute:
        screen = ArticleList(arguments!['likes']);
        break;
      case resumeRoute:
        screen = const PDFViewerPage(path: 'assets/images/resume.pdf');
        break;
      case matCompRoute:
        screen = const ExampleParallax();
        break;
      case locationDetailRoute:
        screen = LocationDetail(arguments!['id']);
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
    return MaterialPageRoute<dynamic>(
      builder: (_) => screen,
      settings: settings,
    );
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(titleTextStyle: appBarTextStyle),
      textTheme: const TextTheme(
        displayLarge: titleTextStyle,
        bodyLarge: body1TextStyle,
      ),
    );
  }
}
