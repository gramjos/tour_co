import 'package:flutter/material.dart';
import 'package:tour_co/style.dart';
import '../../../widgets/image_banner.dart';
import '../text_section.dart';
import '../../../models/location.dart';

class ArticleDetail extends StatelessWidget {
  final int _locationID;
  const ArticleDetail(this._locationID, {super.key});

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchByID(_locationID);

    return Scaffold(
      appBar: AppBar(
        title: Text(location!.name),
        backgroundColor: matte,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: gradientBoxDec,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageBanner(location.imagePath),
              ...textSections(location),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
