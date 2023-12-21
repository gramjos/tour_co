import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:universal_html/html.dart' as html;

class PDFViewerPage extends StatelessWidget {
  final String path;

  const PDFViewerPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 130, 30),
        title: const Text('Graham J. Joss'),
      ),
      body: Center(
        child: SfPdfViewer.asset(
          'assets/images/resume.pdf',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Download from Github',
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirmation'),
                content: const Text(
                    'Download is available from github.com/gramjos/resume \nTake me to there to download?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('NO'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      final anchor = html.AnchorElement(
                        href:
                            'https://github.com/gramjos/resume/blob/master/Graham.Joss.Cover.Resume.pdf', // Replace with your PDF URL
                      )
                        ..setAttribute('download', 'resume.pdf')
                        ..setAttribute('target', '_blank'); // Open in a new tab
                      html.document.body!.children.add(anchor);
                      anchor.click();
                      html.document.body!.children.remove(anchor);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sending you to GitHub')),
                      );
                    },
                    child: const Text('YES'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.download_sharp),
      ),
    );
  }
}
