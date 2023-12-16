import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tour_co/app.dart';
import 'package:tour_co/scoped_models/scoped_like_count.dart';
import 'package:tour_co/screens/home/dynamic_liking.dart';

class StartPage extends StatelessWidget {
  StartPage({super.key});

  final ScopedLikeCount likeCounter = ScopedLikeCount();

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 216, 244),
      appBar: AppBar(
        title: const Text('Graham J. Joseph'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 8.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.asset(
                  'assets/images/pro_pic.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(
              width: 91), // Add some spacing between the image and the button
          Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 252, 226, 179),
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to the portfolio site of Graham Joss',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hi, I\'m Graham and I\'m a knowledge addict. I have an insatiable curiosity that knows no bounds. ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _passLikes(context, likeCounter.lc.likeCT),
                child: const Text('See Graham\'s work'),
              ),
              const SizedBox(width: 16), // Add spacing between the buttons
              ElevatedButton(
                onPressed: () {
                  _passResume(context, likeCounter.lc.likeCT);
                },
                child: const Text('Another Button'),
              ),
            ],
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
    );
    return ScopedModel<ScopedLikeCount>(
      model: likeCounter,
      child: scaffold,
    );
  }

  void _passResume(BuildContext context, int likes) {
    Navigator.pushNamed(context, resumeRoute, arguments: {"likes": likes});
  }

  void _passLikes(BuildContext context, int likes) {
    Navigator.pushNamed(context, locationRoute, arguments: {"likes": likes});
  }

  void pressButton() {
    print("activated the button :)");
  }
}
