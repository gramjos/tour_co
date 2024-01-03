import 'package:flutter/material.dart';
import 'package:tour_co/screens/journal_article_list/journal_datum/journal.dart';
import 'package:tour_co/style.dart';
import 'package:tour_co/widgets/action_image_banner.dart';
import '../../app.dart';

class JournalList extends StatelessWidget {
  final int _likes;
  const JournalList(this._likes, {super.key});

  @override
  Widget build(BuildContext context) {
    final journals = Journal.fetchAll();
    String mes = _likes > 1
        ? 'Thanks for $_likes likes :)'
        : 'Thanks for $_likes like :)';
    return Scaffold(
      appBar: AppBar(
        title: Text(mes),
        backgroundColor: matte,
      ),
      body: Container(
        decoration: gradientBoxDec,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 15),
          itemCount: journals.length,
          itemBuilder: (context, index) =>
              _itemBuilder(context, journals[index]),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, Journal journal) {
    return GestureDetector(
      onTap: () => _onLocationTap(context, journal.id),
      child: Container(
        padding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
        child: SizedBox(
          height: 400,
          width: 400,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                height: 25,
                width: 250,
                color: startScreenButton,
                child: Text(journal.name),
              ),
              Container(
                height: 300,
                width: 300,
                alignment: Alignment.bottomCenter,
                child: ActionImageBanner(journal.preImagePath),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLocationTap(BuildContext context, int localID) {
    Navigator.pushNamed(context, testJournalRoute, arguments: {"id": localID});
  }
}
