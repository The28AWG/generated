import 'package:equatable/equatable.dart';

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