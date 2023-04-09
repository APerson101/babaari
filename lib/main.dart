import 'dart:io';

import 'package:babaari/helpers/database.dart';
import 'package:babaari/main_view.dart';
import 'package:docx_template/docx_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'models/adhocstaff.dart';

void main() async {
  GetIt.I.registerSingleton<Isar>(await Isar.open([AddHocStaffSchema]));
  GetIt.I.registerSingleton<DatabaseHelper>(DatabaseHelper());
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
    ref.listen(saveTemplate, (pr, nx) async {
      if (pr != nx && nx) {
        var data = await rootBundle.load('templates/template.docx');
        var buffer = data.buffer;
        var bytesData = buffer.asUint8List();
        final docx = await DocxTemplate.fromBytes(bytesData);

        Content c = Content();
        c
          ..add(TextContent('name', nameController.text))
          ..add(TextContent('school', institutionLocationController.text))
          ..add(TextContent('id', idController.text));
        final bytes = await docx.generate(c);
        if (bytes != null) {
          var data = await rootBundle.load('generated/generated.docx');
          Directory tempDir = await getTemporaryDirectory();
          var doc = PdfDocument();
          doc.pages.add().graphics.drawString(
              'heelo world',
              PdfStandardFont(PdfFontFamily.helvetica, 12,
                  style: PdfFontStyle.bold),
              bounds: const Rect.fromLTWH(0, 0, 200, 50),
              brush: PdfBrushes.red,
              pen: PdfPens.blue,
              format: PdfStringFormat(alignment: PdfTextAlignment.left));
          var file = (await File(
                  '${(await getApplicationDocumentsDirectory()).path}/generated.pdf')
              .writeAsBytes((await doc.save())));
          // var file = (await File(
          //         '${(await getApplicationDocumentsDirectory()).path}/generated.docx')
          //     .writeAsBytes(bytes));
          // String tempPath = tempDir.path;
          // var filePath = '$tempPath/generated.docx';
          // var generated = await (await File(filePath)
          //         .writeAsBytes(data.buffer.asUint8List(), flush: true))
          //     .writeAsBytes(bytes, flush: true);
          // var path = generated.path;
          ref.watch(generateDocx.notifier).state = file.path;
        }
      }
    });

    ref.listen(generateDocx, (pr, nx) async {
      if (nx != null) {
        var bytes = File(nx).readAsBytesSync();
        final PdfDocument document = PdfDocument(inputBytes: bytes);
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;
        var filePath = '$tempPath/generated.pdf';
        var generated =
            await File(filePath).writeAsBytes(await document.save());
        // ref.watch(generatedPdfPath.notifier).state = nx;
        ref.watch(generatedPdfPath.notifier).state = generated.path;
        document.dispose();
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
                  ref.read(saveTemplate.notifier).state == false
                      ? ref.watch(saveTemplate.notifier).state = true
                      : null;
                },
                child: const Text("Save  Edited Template")),
            ref.watch(generatedPdfPath) != null
                ? SizedBox(
                    height: 500,
                    child: SfPdfViewer.file(File(ref.watch(generatedPdfPath)!)))
                : Container(),
            ElevatedButton(
                onPressed: () async {
                  // print pdf doc
                  final pdf = File(ref.watch(generatedPdfPath)!);
                  await Printing.layoutPdf(onLayout: (_) => pdf.readAsBytes());
                },
                child: const Text("Print")),
          ]),
        ),
      ),
    ));
  }
}

final saveTemplate = StateProvider.autoDispose((ref) => false);

final generateDocx = StateProvider<String?>((ref) => null);
final generatedPdfPath = StateProvider<String?>((ref) => null);
