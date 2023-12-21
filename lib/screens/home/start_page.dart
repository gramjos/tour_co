import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tour_co/app.dart';
import 'package:tour_co/scoped_models/scoped_like_count.dart';
import 'package:tour_co/scoped_models/scoped_pic_change.dart';
import 'package:tour_co/screens/home/dynamic_liking.dart';
import 'package:tour_co/screens/home/dynamic_pic.dart';
import 'package:tour_co/screens/home/platform_info.dart';

class StartPage extends StatelessWidget {
  StartPage({super.key});

  final ScopedLikeCount likeCounter = ScopedLikeCount();
  final ScopedPicChange picChanger = ScopedPicChange();

  @override
  Widget build(BuildContext context) {
    // Check the platform
    Map<String, dynamic> platformInfo = PlatformInfo.getPlatformInfo(context);
    String platform = platformInfo['platform'];
    double pWidth = platformInfo['pWidth'];
    double pHeight = platformInfo['pHeight'];
    double pFontSize = platformInfo['pFontSize'];

    var scaffold = Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 201, 247),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 209, 254, 220),
        title: Text(
          'Graham J. Joss',
          style: TextStyle(
              fontFamily: "Tourney",
              fontSize: pFontSize,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 74, 74, 74)),
        ),
      ),
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(2.0),
        maxScale: 1.6,
        child: SingleChildScrollView(
          child: Row(
            children: [
              const SizedBox(
                width: 9,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 9,
                  ),
                  MouseRegion(
                    onEnter: (PointerEnterEvent event) {
                      print('Mouse entered');
                      likeCounter.toggle();
                      picChanger.togglePic();
                    },
                    onExit: (PointerExitEvent event) {
                      print('Mouse exited');
                      likeCounter.toggle();
                      picChanger.togglePic();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        // add border
                        border: Border.all(
                          width: 19,
                          color: const Color.fromARGB(255, 209, 254, 220),
                        ),
                        // set border radius
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Image.asset(
                        'assets/images/pro_pic.jpg',
                        height: pHeight,
                        width: pWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 209, 254, 220),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 168, 255, 188),
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: () {
                        _passResume(context, likeCounter.lc.likeCT);
                      },
                      child: const Text('Resume and Cover Letter'),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 168, 255, 188),
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: () {
                        _passLikes(context, likeCounter.lc.likeCT);
                      },
                      child: const Text('Mathematics and Computation Projects'),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 168, 255, 188),
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, matCompRoute);
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
              const SizedBox(
                width: 10,
                height: 15,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 168, 255, 188),
        tooltip: "Spread Love",
        child: const Icon(
          Icons.favorite_outline_sharp,
          color: Color.fromARGB(255, 235, 91, 139),
        ),
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
