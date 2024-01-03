import 'package:flutter/material.dart';
import 'package:tour_co/screens/journal_article_list/journal/journal_detail.dart';
import 'package:tour_co/screens/journal_article_list/journal_list.dart';
import 'package:tour_co/screens/resume/resume.dart';
import 'screens/tech_article_list/article_list.dart';
import 'screens/tech_article_list/article/article_detail.dart';
import 'screens/home/start_page.dart';
import 'screens/art_work_list/para.dart';
import 'style.dart';

const String hom = '/';
const String homie = '/homie';
const String testRoute = '/testing';
const String testJournalRoute = '/testing-journal';
const String resumeRoute = '/resume';
const String artRoute = '/art';
const String artEgypt = '/egypt';
const String mathCompRoute = '/maths-computation';
const String mathCompArticleRoute = '/maths-computation/article';
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
      case mathCompRoute:
        screen = ArticleList(arguments!['likes']);
        break;
      case resumeRoute:
        screen = const PDFViewerPage(path: 'assets/images/resume.pdf');
        break;
      case artRoute:
        screen = const ExampleParallax();
        break;
      case testRoute:
        screen = JournalList(arguments!['likes']);
        break;
      case testJournalRoute:
        screen = JournalDetail(arguments!['id']);
        break;
      case mathCompArticleRoute:
        screen = ArticleDetail(arguments!['id']);
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
      tooltipTheme: TooltipThemeData(
        textStyle: const TextStyle(fontSize: 26, color: Colors.white),
        decoration: BoxDecoration(
          border: Border.all(
            width: 6,
            color: Colors.yellow,
          ),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 39, 119, 176),
              Color.fromARGB(255, 58, 169, 2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
