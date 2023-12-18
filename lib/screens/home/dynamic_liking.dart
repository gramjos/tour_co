import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_models/scoped_like_count.dart';

class DynamicLiking extends StatelessWidget {
  const DynamicLiking({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedLikeCount>(
      builder: (context, child, model) {
        StringBuffer mes = StringBuffer();
        mes.write("the accounting of likes: ${model.lc.likeCT}\n");
        mes.write("On my picture :) ${model.lc.name}");
        return Text(mes.toString());
      },
    );
  }
}
