import 'dart:async';

import 'package:dark_novels_io/io.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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

class CreateThemeVariable extends Equatable {
  final String name;
  final String description;
  final String defaultValue;

  CreateThemeVariable({
    required this.name,
    required this.description,
    required this.defaultValue,
  });

  List<Object?> get props => [
        this.name,
        this.description,
        this.defaultValue,
      ];

  factory CreateThemeVariable.fromJson(Map<String, dynamic> json) =>
      _$CreateThemeVariableFromJson(json);

  Map<String, dynamic> toJson() => _$CreateThemeVariableToJson(this);
}

CreateThemeVariable _$CreateThemeVariableFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CreateThemeVariable',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['name', 'description', 'defaultValue'],
        );
        final val = CreateThemeVariable(
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          defaultValue: $checkedConvert('defaultValue', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$CreateThemeVariableToJson(
        CreateThemeVariable instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'defaultValue': instance.defaultValue,
    };

class KeyValue extends Equatable {
  final String key;
  final dynamic value;

  KeyValue(
    this.key,
    this.value,
  );

  @override
  List<Object?> get props => [
        this.key,
        this.value,
      ];

  factory KeyValue.fromJson(Map<String, dynamic> json) {
    var i = json.entries.skipWhile((value) => value.key == 'id');
    String key = i.first.key;
    dynamic value = i.first.value;
    return KeyValue(key, value);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{this.key: this.value};

  bool hasValue() {
    return this.value != null;
  }

  String? stringValue() {
    return hasValue() ? this.value.toString() : null;
  }

  bool? booleanValue() {
    return hasValue() ? 'true'.toLowerCase() == stringValue() : null;
  }

  int? integerValue() {
    return hasValue() ? int.tryParse(stringValue()!) : null;
  }

  double? doubleValue() {
    return hasValue() ? double.tryParse(stringValue()!) : null;
  }
}
