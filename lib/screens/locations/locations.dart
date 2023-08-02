import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/location.dart';
import '../../widgets/image_banner.dart';

class Locations extends StatelessWidget {
  final int _likes;
  const Locations(this._likes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();
    String mes = 'Locations: pick n click $_likes?';
    return Scaffold(
      appBar: AppBar(
        title: Text(mes),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) =>
            _itemBuilder(context, locations[index]),
      ),
      backgroundColor: const Color.fromARGB(255, 237, 209, 0),
    );
  }

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
      onTap: () => _onLocationTap(context, location.id),
      child: Container(
        padding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
        child: SizedBox(
          height: 200,
          width: 200,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                height: 25,
                width: 150,
                color: const Color.fromARGB(255, 250, 1, 1),
                child: Text(location.name),
              ),
              Container(
                height: 100,
                width: 100,
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
