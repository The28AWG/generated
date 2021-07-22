import 'dart:async';

import 'package:dark_novels_io/io.dart';

class TocService {
  final DarkIO io;

  TocService(
    this.io,
  );

  Future<Response> getToc({
    required int bookId,
  }) =>
      (io.newRequest('/v2/toc/:id')
            ..get()
            ..path = {
              ':id': bookId,
            })
          .execute();
}
