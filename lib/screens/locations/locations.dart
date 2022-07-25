import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/location.dart';

class Locations extends StatelessWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: ListView(
          children: locations
              .map((local) => GestureDetector(
                    child: Text(local.name),
                    onTap: () => _onLocationTap(context, local.id),
                  ))
              .toList()),
    );
  }

  void _onLocationTap(BuildContext context, int localID) {
    Navigator.pushNamed(context, locationDetailRoute,
        arguments: {"id": localID});
  }
}
