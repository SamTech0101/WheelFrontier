import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

// it can be initailzied with a pdf to  seeing pdf documents

class PdfViewerPage extends StatelessWidget {
  final PDFDocument document;

  PdfViewerPage({@required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: PDFViewer(document: document),
        ),
      ),
    );
  }
}
