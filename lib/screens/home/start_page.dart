import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tour_co/app.dart';
import 'package:tour_co/scoped_models/scoped_like_count.dart';
import 'package:tour_co/scoped_models/scoped_pic_change.dart';
import 'package:tour_co/screens/home/dynamic_liking.dart';
import 'package:tour_co/screens/home/platform_info.dart';
import 'package:tour_co/style.dart';

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
      backgroundColor: startScreenBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Show Platform Info',
            onPressed: () {
              Navigator.pushNamed(context, matCompRoute);
            },
          ),
        ],
        backgroundColor: matte,
        title: Text(
          'Graham J. Joss',
          style: titleSignature(pFontSize),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
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
                            color: matte,
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
                        color: matte,
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
                          backgroundColor: startScreenButton,
                          foregroundColor: Cols.black,
                        ),
                        onPressed: () {
                          _passResume(context, likeCounter.lc.likeCT);
                        },
                        child: const Text('Resume and Cover Letter'),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: startScreenButton,
                          foregroundColor: Cols.black,
                        ),
                        onPressed: () {
                          _passLikes(context, likeCounter.lc.likeCT);
                        },
                        child:
                            const Text('Mathematics and Computation Projects'),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: startScreenButton,
                          foregroundColor: Cols.black,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, matCompRoute);
                        },
                        child: const Text('Poetry'),
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                  height: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: double.infinity, // Expand the container to full width
                color: matte,
                child: Column(
                  children: [
                    Text(platform),
                    const DynamicLiking(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: startScreenButton,
        tooltip: "Spread Love",
        child: const Icon(
          Icons.favorite_outline_sharp,
          color: Cols.heartOutline,
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
