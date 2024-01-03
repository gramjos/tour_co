import 'package:flutter/material.dart';
import 'package:tour_co/screens/journal_article_list/journal_datum/journal.dart';
import 'package:tour_co/style.dart';
import '../../../widgets/image_banner.dart';
import '../text_section.dart';

class JournalDetail extends StatelessWidget {
  final int _journalID;
  const JournalDetail(this._journalID, {super.key});

  @override
  Widget build(BuildContext context) {
    final journal = Journal.fetchByID(_journalID);

    return Scaffold(
      appBar: AppBar(
        title: Text(journal!.name),
        backgroundColor: matte,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: gradientBoxDec,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageBanner(journal.imagePath),
              ...textSections(journal),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> textSections(Journal journal) {
    return journal.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
