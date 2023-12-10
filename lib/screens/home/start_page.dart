import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tour_co/app.dart';
import 'package:tour_co/scoped_models/scoped_like_count.dart';
import 'package:tour_co/screens/home/dynamic_liking.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  final ScopedLikeCount likeCounter = ScopedLikeCount();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ScopedLikeCount>(
      model: likeCounter,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Graham J. Joseph'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () => _passLikes(context, likeCounter.lc.likeCT),
                child: const Text('See Graham\'s work'),
              ),
            ),
            const Center(
              child: DynamicLiking(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "press press",
          child: const Icon(Icons.favorite),
          onPressed: () {
            pressButton();
            likeCounter.increment();
          },
        ),
      ),
    );
  }

  void _passLikes(BuildContext context, int likes) {
    Navigator.pushNamed(context, locationRoute, arguments: {"likes": likes});
  }

  void pressButton() {
    print("activated the button :)");
  }
}
