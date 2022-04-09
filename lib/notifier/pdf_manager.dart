import 'dart:io';
import 'dart:typed_data';

// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:flutter/foundation.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:pdfx/pdfx.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../src/function.dart';

class PDFManager extends ChangeNotifier {
  static PDFManager on(BuildContext context) =>
      Provider.of<PDFManager>(context);
  static PDFManager of(BuildContext context) =>
      Provider.of<PDFManager>(context, listen: false);

  final String slash = Platform.isWindows ? "\u005c" : "\u002f";
  String path = "", name = "";
  int? size;
  PdfController? controller;
  // pw.Document? pdf;

  void getFile(String path, String name, int size, Uint8List bytes) async {
    kPrint([path, name, size]);
    this.path = path;
    this.name = name;
    this.size = size;

    controller = PdfController(document: PdfDocument.openData(bytes));
    // doc = await PDFDocument.fromFile(File(path));
    // await Lock().synchronized(() {
    //   doc = PdfDocument.openFile(path);
    // });
    // pdf ??= pw.Document();
    // pdf!.addPage(pw.Page(
    //     pageFormat: PdfPageFormat.a4,
    //     build: (pw.Context context) {
    //       return pw.Center(
    //         child: pw.Text("Hello World"),
    //       ); // Center
    //     }));
    notifyListeners();
  }
}
