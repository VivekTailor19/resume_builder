import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> createPDF()
async {
  var pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(15),
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      build: (context) {
        return pw.Center(
          child: pw.Container(color: PdfColors.red,height: 150,width: 150)
        );
      },
    )
  );

  Directory? directory = await getTemporaryDirectory();
  File file = File("${directory!.path}/flutter.pdf");
  print("${directory!.path}/flutter.pdf");
  await file.writeAsBytes(await pdf.save());
}