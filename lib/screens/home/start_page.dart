import 'package:tour_co/widgets/my_rive_animation.dart';
import 'package:universal_html/html.dart' as html;
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tour_co/app.dart';
import 'package:tour_co/scoped_models/scoped_like_count.dart';
import 'package:tour_co/screens/home/dynamic_liking.dart';
import 'package:tour_co/screens/home/platform_info.dart';
import 'package:tour_co/style.dart';

class StartPage extends StatelessWidget {
  StartPage({super.key});

  final ScopedLikeCount likeCounter = ScopedLikeCount();

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
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Tooltip(
                message: "anything in green is an actionable region",
                child: IconButton(
                  icon: const Icon(Icons.info),
                  onPressed: () => showAboutDialog(
                    applicationName: "Graham J. Joss Portfolio",
                    applicationVersion: "0.0.1",
                    applicationLegalese: "© 2024 Graham J. Joss",
                    barrierLabel: "About this",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.8),
                    context: context,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 6,
                              color: startScreenButton,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: Container(
                              color: pastelPurp,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: startScreenBackgroundColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                            height: pHeight * (3 / 4),
                                            width: pWidth * (3 / 4),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 12,
                                                  blurRadius: 15,
                                                  offset: const Offset(4,
                                                      4), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Image.asset(
                                              'assets/images/pro_pic2.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          color: matte,
                                          child: const Column(
                                            children: [
                                              Text(
                                                "This is a portfolio website for Graham J. Joss.",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                              Text(
                                                "It is built with Flutter, and is a work in progress",
                                                style: TextStyle(fontSize: 24),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              color: matte,
                                              child: const Text(
                                                "The source code is available at ",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              child: GestureDetector(
                                                onTap: () {
                                                  final anchor =
                                                      html.AnchorElement(
                                                    href:
                                                        'https://github.com/gramjos/tour_co',
                                                  )..setAttribute(
                                                          'target', '_blank');
                                                  html.document.body!.children
                                                      .add(anchor);
                                                  anchor.click();
                                                  html.document.body!.children
                                                      .remove(anchor);
                                                },
                                                child: const Text(
                                                  "here",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.blue,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
        backgroundColor: matte,
        centerTitle: true,
        title: Text(
          'Graham J. Joss',
          style: titleSignature(pFontSize),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 9,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 9,
                ),
                Column(
                  children: [
                    MouseRegion(
                      onEnter: (PointerEnterEvent event) {
                        likeCounter.toggle();
                      },
                      onExit: (PointerExitEvent event) {
                        likeCounter.toggle();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          // add border
                          border: Border.all(
                            width: 19,
                            color: startScreenButton,
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
                      const SizedBox(
                        height: 9,
                      ),
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
                        child: const Tooltip(
                          message: "View my professional documents",
                          child: Text('Resume and Cover Letter'),
                        ),
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
                        child: const Tooltip(
                          message: "Technical projects",
                          child: Text('Mathematics and Computation Projects'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: startScreenButton,
                          foregroundColor: Cols.black,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, artRoute);
                        },
                        child: const Tooltip(
                          message: "Art never dies",
                          child: Text('Art'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: startScreenButton,
                          foregroundColor: Cols.black,
                        ),
                        onPressed: () {
                          _passTestLikes(context, likeCounter.lc.likeCT);
                        },
                        child: const Tooltip(
                          message: "TDD",
                          child: Text('testing'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        height: 333,
                        width: 333,
                        child: MyRiveAnimation(),
                      ),
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
                    const Tooltip(
                      message:
                          "Hover over my picture or press the heart\n to see this area change",
                      child: DynamicLiking(),
                    ),
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
    Navigator.pushNamed(context, mathCompRoute, arguments: {"likes": likes});
  }

  void _passTestLikes(BuildContext context, int likes) {
    Navigator.pushNamed(context, testRoute, arguments: {"likes": likes});
  }

  void pressButton() {
    final logger = Logger();

    logger.d("activated the button :)");
  }
}
