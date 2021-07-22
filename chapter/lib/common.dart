import 'package:equatable/equatable.dart';

class ApiField extends Equatable {
  final int id;
  final String key;
  final dynamic value;

  ApiField(
    this.id,
    this.key,
    this.value,
  );

  @override
  List<Object?> get props => [
        this.id,
        this.key,
        this.value,
      ];

  factory ApiField.fromJson(Map<String, dynamic> json) {
    int id = json['id'] as int;
    var i = json.entries.skipWhile((value) => value.key == 'id');
    String key = i.first.key;
    dynamic value = i.first.value;
    return ApiField(id, key, value);
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': this.id, this.key: this.value};

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

class LongId extends Equatable {
  final int id;

  LongId(
    this.id,
  );

  @override
  List<Object?> get props => [
        this.id,
      ];

  factory LongId.fromJson(
    Map<String, dynamic> json,
  ) =>
      LongId(
        json['id'] as int,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}

class StringId extends Equatable {
  final String id;

  StringId(
    this.id,
  );

  @override
  List<Object?> get props => [
        this.id,
      ];

  factory StringId.fromJson(
    Map<String, dynamic> json,
  ) =>
      StringId(
        json['id'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
