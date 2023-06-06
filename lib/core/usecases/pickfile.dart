// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:read_csv/presentation/riverpod/providers.dart';
import 'package:read_csv/presentation/riverpod/stateproviders.dart';

Future<void> pickfile(WidgetRef ref) async {
  final result = await FilePicker.platform.pickFiles(allowMultiple: false);
  final utils = ref.watch(utilsProvider);
  
  if (result == null) return;

  String? filePath = result.files.first.path!;
  final pickedExtension = path.extension(filePath);
  if (pickedExtension == ".csv" ) {
    final input = File(filePath).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();

    ref.watch(file);
    ref.read(file.notifier).state = fields;
    ref.read(fileStatusProvider.notifier).state = true;
    utils.showToast(
        message: "${result.files.first.name} read successfully",
        color: Colors.green);
    log(fields.toString());
  } else {
    utils.showToast(message: "Pick .csv file");
    ref.read(fileStatusProvider.notifier).state = false;
    return;
  }
}
