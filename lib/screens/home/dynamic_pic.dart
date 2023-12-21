import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_models/scoped_pic_change.dart';

class DynamicPic extends StatelessWidget {
  const DynamicPic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedPicChange>(
      builder: (context, child, model) {
        return Image.asset(
          model.pc.pic.toString(),
          height: 300,
          width: 300,
        );
      },
    );
  }
}
