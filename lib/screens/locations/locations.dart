// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/location.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
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
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": localID});
  }
}
