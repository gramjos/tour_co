import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatelessWidget {
  final String path;

  const PDFViewerPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 168, 255, 188),
        title: const Text('Graham J. Joss'),
      ),
      body: Center(
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SfPdfViewer.asset(
              'assets/images/resume.pdf',
              canShowPaginationDialog: true,
            ),
          ),
        ),
      ),
    );
  }
}
