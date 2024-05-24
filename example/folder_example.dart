import 'dart:developer';

import 'package:folder/folder.dart';

void main() async {
  final Folder<int, String> string = await getString();
  string.fold(
    (error) => log(error.toString()),
    (result) => log,
  );
}

Future<Folder<int, String>> getString() async {
  const String str = 'example';
  if (str.isEmpty) {
    return Error(0);
  }
  return Result(str);
}
