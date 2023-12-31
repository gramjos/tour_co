import 'package:flutter/material.dart';
import 'package:tour_co/style.dart';
import '../../app.dart';
import '../../models/location.dart';
import '../../widgets/image_banner.dart';

class ArticleList extends StatelessWidget {
  final int _likes;
  const ArticleList(this._likes, {super.key});

  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();
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
          itemCount: locations.length,
          itemBuilder: (context, index) =>
              _itemBuilder(context, locations[index]),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
      onTap: () => _onLocationTap(context, location.id),
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
                child: Text(location.name),
              ),
              Container(
                height: 300,
                width: 300,
                alignment: Alignment.bottomCenter,
                color: const Color.fromARGB(255, 30, 1, 250),
                child: ImageBanner(location.preImagePath),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLocationTap(BuildContext context, int localID) {
    Navigator.pushNamed(context, locationDetailRoute,
        arguments: {"id": localID});
  }
}