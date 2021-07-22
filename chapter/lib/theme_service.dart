import 'dart:async';

import 'package:dark_novels_io/io.dart';

import './common.dart';
import './generated_model.dart';

class ThemeService {
  final DarkIO io;

  ThemeService(
    this.io,
  );

  Future<Response> getThemeSettings() =>
      (io.newRequest('/v2/theme/')..get()).execute();

  Future<Response> updateThemeSettings({
    required KeyValue model,
  }) =>
      (io.newRequest('/v2/theme/')
            ..put()
            ..model = model)
          .execute();

  Future<Response> createThemeVariable({
    required CreateThemeVariable model,
  }) =>
      (io.newRequest('/v2/theme/')
            ..post()
            ..model = model)
          .execute();

  Future<Response> updateThemeVariable({
    required int id,
    required KeyValue model,
  }) =>
      (io.newRequest('/v2/theme/:id')
            ..put()
            ..path = {
              ':id': id,
            }
            ..model = model)
          .execute();

  Future<Response> removeThemeVariable({
    required int id,
  }) =>
      (io.newRequest('/v2/theme/:id')
            ..delete()
            ..path = {
              ':id': id,
            })
          .execute();

  Future<Response> removeValue({
    required int id,
    required String theme,
  }) =>
      (io.newRequest('/v2/theme/:id/:theme')
            ..delete()
            ..path = {
              ':id': id,
              ':theme': theme,
            })
          .execute();

  Future<Response> setValue({
    required int id,
    required String theme,
    required KeyValue model,
  }) =>
      (io.newRequest('/v2/theme/:id/:theme')
            ..put()
            ..path = {
              ':id': id,
              ':theme': theme,
            }
            ..model = model)
          .execute();
}
