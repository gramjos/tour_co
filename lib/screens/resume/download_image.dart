import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class DownloadImage extends StatelessWidget {
  const DownloadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final anchor = html.AnchorElement(
          href:
              'https://github.com/gramjos/resume/blob/master/Graham.Joss.Cover.Resume.pdf', // Replace with your PDF URL
        )..setAttribute('download', 'resume.pdf');
        html.document.body!.children.add(anchor);
        anchor.click();
        html.document.body!.children.remove(anchor);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Download started!')),
        );
      },
      child: const Icon(Icons.download),
    );
  }
}
