import 'dart:io';
import 'dart:ui';

import 'package:babaari/helpers/database.dart';
import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recase/recase.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../models/department.dart';

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

  generatePosting(
      {required String from,
      required Department department,
      required String to,
      required AddHocStaff person,
      required PdfDocument document}) async {
    try {
      var todayDate = DateFormat.yMMMMd().format(DateTime.now());
      var reference = "Ref: NITDA/HQ/016/VOL.VI";
      var hrRef = "DEPT./UNIT: HRA";
      var mem = "INTERNAL MEMO";
      var subject =
          "POSTING OF ${person.firstname!.toUpperCase()} ${person.lastname!.toUpperCase()}";
      var title = "The above subject matter refers please.";
      var body1 = person.staffType == AddHocStaffType.corper
          ? "I am directed to inform you that the above-named corps member, a graduate of "
              "${ReCase('${person.courseOfStudy}').titleCase}, has been accepted to undergo ${person.gender == 'M' ? 'his' : 'her'} National Youth Service Scheme in the National Information Technology Development Agency (NITDA)."
          : "I am directed to inform you that the above-named student has been accepted to undergo ${person.gender == 'M' ? 'his' : 'her'} student industrial working experience Scheme (SIWES) in National Information Technology Development Agency (NITDA).";
      String body2 =
          "Futhermore, ${person.gender == "M" ? 'he' : 'she'} is being posted to the ${ReCase('${department.fullName}').titleCase} Department for the programme with effect from ${DateFormat.yMMMMd().format(person.startDate!)} to ${DateFormat.yMMMMd().format(person.endDate!)}.";
      String thanks = "Thank you.";

      String signatoryName = "CHRISTIE IZI (MRS)";
      String sigRep = "For: Director, Human Resource & Administration";

      // pdf generator
      PdfFont subHeadingFont = PdfStandardFont(PdfFontFamily.helvetica, 12);
      PdfPage page = document.pages.add();
      PdfGraphics graphics = page.graphics;
      PdfTextElement element =
          PdfTextElement(text: '$hrRef\n\n$reference', font: subHeadingFont);
      var refrenceSize = subHeadingFont.measureString('$hrRef\n\n$reference');

      // draw bounding box
      var leftOffSet = page.getClientSize().width - refrenceSize.width - 20;
      graphics.drawLine(PdfPen(PdfColor(0, 0, 0), width: 1),
          Offset(leftOffSet, 5), Offset(leftOffSet, 70));

      graphics.drawLine(
          PdfPen(PdfColor(0, 0, 0), width: 1),
          Offset(leftOffSet + refrenceSize.width + 20, 5),
          Offset(leftOffSet + refrenceSize.width + 20, 70));

      graphics.drawLine(
          PdfPen(PdfColor(0, 0, 0), width: 1),
          Offset(leftOffSet, 5),
          Offset(leftOffSet + refrenceSize.width + 20, 5));
      graphics.drawLine(
          PdfPen(PdfColor(0, 0, 0), width: 1),
          Offset(leftOffSet, 70),
          Offset(leftOffSet + refrenceSize.width + 20, 70));

      // draw reference text
      element.draw(
          page: page,
          bounds: Rect.fromLTWH(
              page.getClientSize().width - refrenceSize.width - 10,
              10,
              refrenceSize.width,
              75));

      var imgData = await rootBundle.load('assets/images/nitdalogo.png');
      var file = (await File(
              '${(await getApplicationDocumentsDirectory()).path}/nitdalogo.png')
          .writeAsBytes(imgData.buffer
              .asUint8List(imgData.offsetInBytes, imgData.lengthInBytes)));
      // draw logo
      page.graphics.drawImage(
          PdfBitmap(file.readAsBytesSync()),
          const Rect.fromLTWH(
            10,
            10,
            150,
            50,
          ));

      // draw heading
      graphics.drawString(
          mem,
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.darkGreen,
          bounds: Rect.fromLTWH(
              page.getClientSize().width / 2 -
                  subHeadingFont.measureString(mem).width / 2,
              150,
              subHeadingFont.measureString(mem).width + 40,
              30));
      // draw block
      var str = 'To:		D(ITIS)\n'
          'From:		CAA(IRW)\n'
          'Date:		$todayDate';
      element = PdfTextElement(text: str, font: subHeadingFont);
      var result = element.draw(
          graphics: graphics,
          page: page,
          bounds: Rect.fromLTWH(
              10, 220, subHeadingFont.measureString(str).width, 50))!;
      element = PdfTextElement(text: 'Subject:   ', font: subHeadingFont);
      result = element.draw(
          page: page,
          graphics: graphics,
          bounds: Rect.fromLTWH(
              10, 280, subHeadingFont.measureString('Subject:   ').width, 30))!;
      element = PdfTextElement(
          text: subject,
          font: PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.bold));
      result = element.draw(
          graphics: graphics,
          page: page,
          bounds: Rect.fromLTWH(result.bounds.width + 20, 280,
              subHeadingFont.measureString(subject).width + 50, 50))!;
      element = PdfTextElement(text: title, font: subHeadingFont);
      element.draw(
          graphics: graphics,
          page: page,
          bounds: Rect.fromLTWH(
              10, 310, subHeadingFont.measureString(title).width + 50, 50))!;
      element = PdfTextElement(
          text: body1,
          font: subHeadingFont,
          format: PdfStringFormat(alignment: PdfTextAlignment.justify));
      result = element.draw(
          graphics: graphics,
          page: page,
          bounds: Rect.fromLTWH(10, 360, page.getClientSize().width - 10, 50))!;
      element = PdfTextElement(
          text: body2,
          font: subHeadingFont,
          format: PdfStringFormat(alignment: PdfTextAlignment.justify));
      result = element.draw(
          graphics: graphics,
          page: page,
          bounds: Rect.fromLTWH(
              10,
              result.bounds.top + result.bounds.height + 30,
              page.getClientSize().width - 10,
              50))!;
      element = PdfTextElement(
        text: thanks,
        font: subHeadingFont,
      );
      result = element.draw(
          graphics: graphics,
          page: page,
          bounds: Rect.fromLTWH(
              10,
              result.bounds.top + result.bounds.height + 30,
              page.getClientSize().width - 10,
              50))!;
      element = PdfTextElement(
        text: signatoryName,
        font: PdfStandardFont(PdfFontFamily.helvetica, 12,
            style: PdfFontStyle.bold),
      );
      result = element.draw(
          graphics: graphics,
          page: page,
          bounds: Rect.fromLTWH(
              page.getClientSize().width / 2 -
                  subHeadingFont.measureString(signatoryName).width / 2,
              result.bounds.top + result.bounds.height + 90,
              subHeadingFont.measureString(signatoryName).width + 40,
              30))!;
      element = PdfTextElement(
        text: sigRep,
        font: subHeadingFont,
      );
      result = element.draw(
          graphics: graphics,
          page: page,
          bounds: Rect.fromLTWH(
              page.getClientSize().width / 2 -
                  subHeadingFont.measureString(signatoryName).width / 2,
              result.bounds.top + result.bounds.height + 15,
              subHeadingFont.measureString(sigRep).width + 40,
              30))!;
    } catch (e) {
      debugPrint(e.toString());
    }
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
      if (option.contains(PrintOptionsCorper.departmentPosting)) {
        var isar = GetIt.I<Isar>();
        var dpts = await isar.departments.where().findAll();
        var department = dpts.firstWhere((element) =>
            element.name == corpers[options.indexOf(option)].department);
        await generatePosting(
          from: "from",
          to: "to",
          department: department,
          document: document,
          person: corpers[options.indexOf(option)],
        );
      }
    }

    for (var option in internOptions) {
      debugPrint("I HAVENT RECEIVED THE NECESSARY DETAILS YET: $option");
      if (option.contains(PrintOptonsSiwes.departmentPosting)) {
        var isar = GetIt.I<Isar>();
        var dpts = await isar.departments.where().findAll();
        var department = dpts.firstWhere((element) =>
            element.name == intern[internOptions.indexOf(option)].department);
        await generatePosting(
          from: "from",
          to: "to",
          department: department,
          document: document,
          person: intern[internOptions.indexOf(option)],
        );
      }
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
