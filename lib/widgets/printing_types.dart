import 'dart:io';

import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PrinterDoc {
  Future<String> generateStatusSIWES(AcceptanceSiwes siwes) async {
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

  generateStatusNysc(
      {required PdfDocument document,
      required AddHocStaff person,
      required String type}) {
    try {
      PdfFont subHeadingFont = PdfStandardFont(PdfFontFamily.helvetica, 12);

      var todayDate = DateFormat.yMMMMd().format(DateTime.now());
      var fileName = "NITDA/HQ/NYSC/016/VOL.XIII";
      PdfPage page = document.pages.add();

      PdfGraphics graphics = page.graphics;

      PdfTextElement element =
          PdfTextElement(text: todayDate, font: subHeadingFont);
      var fileSize = subHeadingFont.measureString(fileName);
      Rect bounds = Rect.fromLTWH(0, 160, graphics.clientSize.width, 30);
      PdfLayoutResult result = element.draw(
          page: page, bounds: Rect.fromLTWH(10, bounds.top + 8, 0, 0))!;
      Offset textPosition = Offset(
          graphics.clientSize.width - fileSize.width - 10, result.bounds.top);
      graphics.drawString(fileName, subHeadingFont,
          brush: element.brush,
          bounds: textPosition & Size(fileSize.width + 2, 20));
      // receiver
      element = PdfTextElement(
          text: 'The Coordinator',
          font: PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.bold));
      result = element.draw(
          page: page,
          bounds: Rect.fromLTWH(10, result.bounds.bottom + 25, 0, 0))!;
      element = PdfTextElement(
          text: 'National Youth Service Corps (NYSC)\n'
              'FCT Secretariat\n'
              'Permanent Orientation Camp\n'
              'Kubwa, Abuja.\n',
          font: subHeadingFont);
      element.brush = PdfBrushes.black;
      result = element.draw(
          page: page,
          bounds: Rect.fromLTWH(10, result.bounds.bottom + 10, 0, 0))!;

      // letter type:
      element = PdfTextElement(
          text: 'LETTER OF ${type.toUpperCase()}',
          font: PdfStandardFont(PdfFontFamily.helvetica, 12,
              multiStyle: [PdfFontStyle.bold, PdfFontStyle.underline]));
      result = element.draw(
          page: page,
          bounds: Rect.fromLTWH(10, result.bounds.bottom + 10, 0, 0))!;

      // letter content:
      element = PdfTextElement(
          text:
              'I am directed to notify the National Youth Service Corps that the Corps member with the\n'
              'following data is hereby ${type == 'acceptance' ? "Accepted" : "Rejected"} to serve with the National Information Technology\n'
              'Development Agency (NITDA).\n\n',
          font: PdfStandardFont(
            PdfFontFamily.helvetica,
            12,
          ),
          format: PdfStringFormat(alignment: PdfTextAlignment.justify));
      result = element.draw(
          page: page,
          bounds: Rect.fromLTWH(10, result.bounds.bottom + 10, 0, 0))!;

      // details
      element = PdfTextElement(
          text:
              'Name:                      ${person.lastname!.toUpperCase()} ${person.firstname!.toUpperCase()}\n\n'
              'Sex:                         ${person.gender!.toUpperCase()}\n\n'
              'Call up No.:             ${person.callUpNumber!.toUpperCase()}\n\n'
              'FCT Code No.:        ${person.institutionID!.toUpperCase()}\n\n'
              'Discipline:               ${person.courseOfStudy!.toUpperCase()}\n\n\n',
          font: PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.bold));
      result = element.draw(
          page: page,
          bounds: Rect.fromLTWH(10, result.bounds.bottom + 10, 0, 0))!;
      // regards
      element = PdfTextElement(
          text:
              "Please accept the assurances of the Director General's highest esteemed regards.\n\n\n\n",
          font: PdfStandardFont(
            PdfFontFamily.helvetica,
            12,
          ));
      result = element.draw(
          page: page,
          bounds: Rect.fromLTWH(10, result.bounds.bottom + 10, 0, 0))!;

      // signer
      element = PdfTextElement(
          text: 'CHRISTIE IZI (MRS)',
          font: PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.bold));
      result = element.draw(
          page: page,
          bounds: Rect.fromLTWH(10, result.bounds.bottom + 25, 0, 0))!;
      element = PdfTextElement(
          text: 'For: Director General/CEO\n\nCC:DG',
          font: PdfStandardFont(
            PdfFontFamily.helvetica,
            12,
          ));
      result = element.draw(
          page: page,
          bounds: Rect.fromLTWH(10, result.bounds.bottom + 5, 0, 0))!;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  savePdfDocumentAndGetPath(PdfDocument document) async {
    var file = (await File(
            '${(await getApplicationDocumentsDirectory()).path}/generated.pdf')
        .writeAsBytes((await document.save())));
    return file.path;
  }

  Future<String> generateMutliPrint(
      {required List<AddHocStaff> corpers,
      required List<List<PrintOptionsCorper>> options,
      required List<AddHocStaff> intern,
      required List<List<PrintOptonsSiwes>> internOptions}) async {
    PdfDocument document = PdfDocument();
    document.pageSettings.orientation = PdfPageOrientation.portrait;
    document.pageSettings.margins.all = 30;
    for (var option in options) {
      if (option.contains(PrintOptionsCorper.acceptance)) {
        generateStatusNysc(
            document: document,
            person: corpers[options.indexOf(option)],
            type: 'acceptance');
      }
      if (option.contains(PrintOptionsCorper.rejection)) {
        generateStatusNysc(
            document: document,
            person: corpers[options.indexOf(option)],
            type: 'rejection');
      }
    }

    for (var option in internOptions) {
      debugPrint("I HAVENT RECEIVED THE NECESSARY DETAILS YET");
    }

    var path = await savePdfDocumentAndGetPath(document);
    return path;
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

class RejectionNysc {
  String name;
  String callUpNumber;
  String sex;
  String fctCode;
  String discipline;
  RejectionNysc({
    required this.name,
    required this.callUpNumber,
    required this.sex,
    required this.fctCode,
    required this.discipline,
  });
}
