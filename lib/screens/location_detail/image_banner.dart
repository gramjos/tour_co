// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _asset_path;

  ImageBanner(this._asset_path);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(height: 370.0),
        decoration: BoxDecoration(color: Color.fromARGB(255, 19, 229, 248)),
        child: Image.asset(
          _asset_path,
          fit: BoxFit.cover,
        ));
  }
}
