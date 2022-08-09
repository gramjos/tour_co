import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_models/scoped_like_count.dart';

class DynamicLiking extends StatelessWidget {
  const DynamicLiking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedLikeCount>(
      builder: ((context, child, model) =>
          Text("the accounting of likes: ${model.lc.likeCT}")),
    );
  }
}
