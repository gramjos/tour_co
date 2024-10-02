import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MDViewer extends StatelessWidget {
  const MDViewer({super.key, required this.title});

  final String title;

  Future<String> loadAsset() async {
    return await rootBundle
        .loadString('assets/articles/Basic State Management.md');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<String>(
        future: loadAsset(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Markdown(data: snapshot.data ?? '');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
