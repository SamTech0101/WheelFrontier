import 'dart:io';

import 'package:path_provider/path_provider.dart';

// some utility functions for working with the files

// moving the app from cache to permanent qpp storage
Future<File> moveFileToAppDir(File sourceFile) async {
  Directory directory = await getApplicationDocumentsDirectory();
  int now = DateTime.now().millisecondsSinceEpoch;
  final newFile = await sourceFile.copy('${directory.path}/$now');
  await sourceFile.delete();
  return newFile;
}

String formatOf(File file) {
  return file.path.split('.').last;
}

String nameOf(String filePath) {
  return filePath.split('/').last;
}
