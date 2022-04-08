import 'package:fluent_ui/fluent_ui.dart';
import 'package:pdfx/pdfx.dart';

import 'notifier/pdf_manager.dart';

class Viewer extends StatelessWidget {
  const Viewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: PdfView(options: options),
      child: PDFManager.on(context).controller == null
          ? const SizedBox.shrink()
          : PdfView(controller: PDFManager.on(context).controller!),
    );
  }
}
