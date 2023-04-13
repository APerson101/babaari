import 'dart:io';

import 'package:flutter/painting.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PrinterDoc {
  Future<String> generateAcceptanceSIWES(AcceptanceSiwes siwes) async {
    var doc = PdfDocument();
    doc.pages.add().graphics.drawString(
        'hello world ${siwes.name} from ${siwes.school} with id: ${siwes.schoolID}',
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(0, 0, 200, 50),
        brush: PdfBrushes.red,
        pen: PdfPens.blue,
        format: PdfStringFormat(alignment: PdfTextAlignment.left));
    var file = (await File(
            '${(await getApplicationDocumentsDirectory()).path}/generated.pdf')
        .writeAsBytes((await doc.save())));
    return file.path;
  }
}

class AcceptanceSiwes {
  String name;
  String school;
  String schoolID;
  AcceptanceSiwes({
    required this.name,
    required this.school,
    required this.schoolID,
  });
}
