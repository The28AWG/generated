import 'dart:async';

import 'package:dark_novels_io/io.dart';

class ChapterPurchaseService {
  final DarkIO io;

  ChapterPurchaseService(
    this.io,
  );

  Future<Response> buyChapter({
    required int chapterId,
  }) =>
      (io.newRequest('/v2/buy/:id')
            ..get()
            ..path = {
              ':id': chapterId,
            })
          .execute();
}
