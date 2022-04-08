import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:pdfx/pdfx.dart';
import 'package:provider/provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

import 'notifier/pdf_manager.dart';
import 'src/function.dart';
import 'viewer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  void load(PDFManager of) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      final PlatformFile file = result.files[0];
      of.getFile(file.path!, file.name, file.size, file.bytes!);
      // final pdf = pw.Document();
      // pdf.addPage(pw.Page(
      //     pageFormat: PdfPageFormat.a4,
      //     build: (context) {
      //       return pw.Center();
      //     }));
      //  result.files[0].path
    }
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: NavigationView(
        // appBar: NavigationAppBar(
        //   leading: Icon(FluentIcons.collapse_menu),
        //   title: Text('PDFing'),
        //   // automaticallyImplyLeading: false,
        // ),
        pane: NavigationPane(
          // selected: 0,
          scrollController: ScrollController(),
          onChanged: (idx) {
            switch (idx) {
              case 0:
                load(PDFManager.of(context));
                break;
            }
          },
          items: [
            PaneItem(
              icon: const Icon(FluentIcons.file_image),
              title: const Text('불러오기'),
            ),
          ],
        ),
        content: NavigationBody(
          index: 0,
          children: const [
            Viewer()
            // Container(
            //   child: PDFManager.on(context).controller == null
            //       ? const SizedBox.shrink()
            //       : PdfView(controller: PDFManager.on(context).controller!),
            // ),
          ],
        ),

        // Container(
        //     // child: PDFManager.on(context).controller == null
        //     //     ? const SizedBox.shrink()
        //     //     : PdfView(controller: PDFManager.on(context).controller!),
        //     ),
        // content: PDFManager.on(context).controller == null
        //     ? const SizedBox.shrink()
        //     : PdfView(controller: PDFManager.on(context).controller!),
        // content: pw.Document()
        // PDFManager.of(context).pdf ?? Container(),
      ),
    );
  }
}
