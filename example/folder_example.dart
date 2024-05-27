import 'dart:developer';

import 'package:folder/folder.dart';

void main() async {
  final Folder<Exception, String> string = await getString();
  string.fold(
    (error) => log(error.toString()),
    (result) => log(result),
  );
}

Future<Folder<Exception, String>> getString() async {
  const String str = 'example';
  if (str.isEmpty) {
    return Left(Exception('str is empty'));
  }
  return Right(str);
}
