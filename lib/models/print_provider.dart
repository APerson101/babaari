import 'dart:io';

import 'package:babaari/widgets/printing_types.dart';
import 'package:get_it/get_it.dart';
import 'package:printing/printing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../dashboard/dashboard_providers.dart';
import 'adhocstaff.dart';

part 'print_provider.g.dart';

@riverpod
class PrintHelper extends _$PrintHelper {
  @override
  FutureOr<void> build() {}

  generatePosting(
      {required String from,
      required String department,
      required String to,
      required AddHocStaff person,
      required PdfDocument document}) async {
    ref.watch(allDepartments).maybeWhen(
        data: (allDpts) async {
          var dpt = allDpts.firstWhere((element) => element.name == department);
          await GetIt.I<PrinterDoc>().generatePosting(
              from: from,
              department: dpt,
              to: to,
              person: person,
              document: document);
          var file =
              await GetIt.I<PrinterDoc>().savePdfDocumentAndGetPath(document);
          final docx = File(file);
          await Printing.layoutPdf(onLayout: (_) => docx.readAsBytes());
        },
        orElse: () {});
  }
}
