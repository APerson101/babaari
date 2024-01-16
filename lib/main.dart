import 'dart:io';

import 'package:babaari/helpers/database.dart';
import 'package:babaari/widgets/printing_types.dart';
import 'package:docx_template/docx_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'activity/activity_providers.dart';
import 'dashboard/dashboard_providers.dart';
import 'main_view.dart';
import 'models/activity.dart';
import 'models/adhocstaff.dart';
import 'models/department.dart';

void main() async {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();

  GetIt.I.registerSingleton<Isar>(await Isar.open(
    [AddHocStaffSchema, ActivitySchema, DepartmentSchema],
    directory: dir.path,
  ));
  GetIt.I.registerSingleton<DatabaseHelper>(DatabaseHelper());
  GetIt.I.registerSingleton<PrinterDoc>(PrinterDoc());
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController institutionLocationController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(newPersonAdded);
    ref.watch(newDepartmentAdded);
    ref.watch(todayActivitesUpdater);
    ref.listen(testDocxTemplate, (pc, nx) async {
      if (nx) {
        var nyscRejection =
            await rootBundle.load('templates/nysc_rejection.docx');
        var docx = await DocxTemplate.fromBytes(nyscRejection.buffer
            .asUint8List(
                nyscRejection.offsetInBytes, nyscRejection.lengthInBytes));
        Content c = Content();
        c.add(TextContent("name", "Abdulhadi"));
        var d = await docx.generate(c);
        var file = await File(
                '${(await getApplicationDocumentsDirectory()).path}/generated.pdf')
            .writeAsBytes(d!);
        await Printing.layoutPdf(onLayout: (_) => file.readAsBytes());
      }
    });
    ref.listen(saveTemplate, (pr, nx) async {
      if (nx) {
        PdfFont subHeadingFont = PdfStandardFont(PdfFontFamily.helvetica, 12);

        var todayDate = DateFormat.yMMMMd().format(DateTime.now());
        var fileName = "NITDA/HQ/NYSC/016/VOL.XIII";
        PdfDocument document = PdfDocument();
        document.pageSettings.orientation = PdfPageOrientation.portrait;
        document.pageSettings.margins.all = 30;
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
            text: 'LETTER OF REJECTION',
            font: PdfStandardFont(PdfFontFamily.helvetica, 12,
                multiStyle: [PdfFontStyle.bold, PdfFontStyle.underline]));
        result = element.draw(
            page: page,
            bounds: Rect.fromLTWH(10, result.bounds.bottom + 10, 0, 0))!;

        // letter content:
        element = PdfTextElement(
            text:
                'I am directed to notify the National Youth Service Corps that the Corps member with the\n'
                'following data is hereby Rejected to serve with the National Information Technology\n'
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
                'Name:                      HAYATUDDEEN MUHYIDDEEN MUHAMMAD\n\n'
                'Sex:                         MALE\n\n'
                'Call up No.:             NYSC/ABU/2019/155963\n\n'
                'FCT Code No.:        FC/19B/6542\n\n'
                'Discipline:               MASS COMMUNICATION\n\n\n',
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
            text: 'GRACE A. ZACKS (MRS)',
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
        var file = (await File(
                '${(await getApplicationDocumentsDirectory()).path}/generated.pdf')
            .writeAsBytes((await document.save())));
        ref.watch(generatedPdfPath.notifier).state = file.path;
      }
    });

    return MaterialApp(
        // theme: ThemeData.dark(),
        home: SafeArea(
      child: MainView(),
    ));
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            CupertinoTextField(
              placeholder: 'Enter Name',
              controller: nameController,
            ),
            CupertinoTextField(
              placeholder: 'Enter Institution',
              controller: institutionLocationController,
            ),
            CupertinoTextField(
              placeholder: 'Enter School ID',
              controller: idController,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.invalidate(saveTemplate);
                  ref.watch(saveTemplate.notifier).state = true;
                },
                child: const Text("Save  Edited Template")),
            ref.watch(generatedPdfPath) != null
                ? SizedBox(
                    height: 500,
                    child: SfPdfViewer.file(File(ref.watch(generatedPdfPath)!)))
                : Container(),
            ElevatedButton(
                onPressed: () async {
                  ref.watch(testDocxTemplate.notifier).state = true;
                },
                child: const Text("test docx")),
            ElevatedButton(
                onPressed: () async {
                  //
                  PdfDocument document = PdfDocument();
                  await GetIt.I<PrinterDoc>().generatePosting(
                      from: "sample ",
                      department: Department()
                        ..fullName =
                            "Information Technology Infrastructure Solution"
                        ..name = 'ITIS'
                        ..units = ['Software Unit'],
                      to: "to",
                      person: AddHocStaff()
                        ..firstname = "Abdul-Hadi"
                        ..lastname = "Hashim"
                        ..staffType = AddHocStaffType.corper
                        ..gender = "M"
                        ..startDate = DateTime.now()
                        ..endDate = DateTime.now()
                        ..courseOfStudy = "Computer Engineering",
                      document: document);
                  var file = await GetIt.I<PrinterDoc>()
                      .savePdfDocumentAndGetPath(document);
                  //print file
                  final pdf = File(file);
                  await Printing.layoutPdf(onLayout: (_) => pdf.readAsBytes());
                },
                child: const Text("Test posting to dpt"))
          ]),
        ),
      ),
    ));
  }
}

final saveTemplate = StateProvider.autoDispose((ref) => false);

final generateDocx = StateProvider<String?>((ref) => null);
final generatedPdfPath = StateProvider<String?>((ref) => null);
final testDocxTemplate = StateProvider((ref) => false);
