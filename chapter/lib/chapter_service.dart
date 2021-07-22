import 'dart:async';

import 'package:dark_novels_io/io.dart';

import './generated_model.dart';

class ChapterService {
  final DarkIO io;

  ChapterService(
    this.io,
  );

  Future<Response> getChapter({
    required GetChapter model,
  }) =>
      (io.newRequest('/v2/chapter/')
            ..upload()
            ..model = model)
          .execute();

  Future<Response> getMetadata({
    required int bookId,
    required int chapterId,
  }) =>
      (io.newRequest('/v2/chapter/:bookId/:chapterId/manifest.json')
            ..get()
            ..path = {
              ':bookId': bookId,
              ':chapterId': chapterId,
            })
          .execute();
}
