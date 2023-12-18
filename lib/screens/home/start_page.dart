import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tour_co/app.dart';
import 'package:tour_co/scoped_models/scoped_like_count.dart';
import 'package:tour_co/screens/home/dynamic_liking.dart';

class StartPage extends StatelessWidget {
  StartPage({super.key});

  final ScopedLikeCount likeCounter = ScopedLikeCount();

  @override
  Widget build(BuildContext context) {
    // Check the platform
    // Define a threshold for mobile screen width
    const double mobileWidthThreshold = 500; // This can be adjusted

    // Get the current screen width
    double screenWidth = MediaQuery.of(context).size.width;
    double pWidth, pHeight;
    String browserType;
    if (screenWidth <= mobileWidthThreshold) {
      browserType = "Mobile Browser";
      pWidth = 50;
      pHeight = 50;
    } else {
      browserType = "Desktop Browser";
      pWidth = 400;
      pHeight = 400;
    }

    String platform = 'Running on: $browserType';

    var scaffold = Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 192, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 168, 255, 188),
        title: const Text('Graham J. Joss'),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            const SizedBox(width: 10),
            MouseRegion(
              onEnter: (PointerEnterEvent event) {
                print('Mouse entered');
              },
              onExit: (PointerExitEvent event) {
                print('Mouse exited');
              },
              child: Container(
                decoration: BoxDecoration(
                  // add border
                  border: Border.all(
                    width: 19,
                    color: const Color.fromARGB(255, 0, 63, 180),
                  ),
                  // set border radius
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Image.asset(
                  'assets/images/pro_pic.jpg',
                  fit: BoxFit.cover,
                  height: pHeight,
                  width: pWidth,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 168, 255, 188),
                    padding: const EdgeInsets.all(8.0),
                    child: const Column(
                      children: [
                        Text(
                          "Welcome to my portfolio!",
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          "I am a knowledge seeker with an insatiable curiosity.",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      _passResume(context, likeCounter.lc.likeCT);
                    },
                    child: const Text('Resume and Cover Letter'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      _passLikes(context, likeCounter.lc.likeCT);
                    },
                    child: const Text('Mathematics and Computation Projects'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      _passLikes(context, likeCounter.lc.likeCT);
                    },
                    child: const Text('Poetry'),
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: DynamicLiking(),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(platform),
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Spread Love",
        child: const Icon(Icons.favorite_outline_sharp),
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
