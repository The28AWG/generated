import 'dart:async';

import 'package:dark_novels_io/io.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class TariffService {
  final DarkIO io;

  TariffService(
    this.io,
  );

  Future<Response> getTariffs() =>
      (io.newRequest('/v2/tariff/')..get()).execute();

  Future<Response> createTariff({
    required CreateTariff model,
  }) =>
      (io.newRequest('/v2/tariff/')
            ..post()
            ..model = model)
          .execute();

  Future<Response> getTariff({
    required int id,
  }) =>
      (io.newRequest('/v2/tariff/:id')
            ..get()
            ..path = {
              ':id': id,
            })
          .execute();

  Future<Response> updateTariff({
    required int id,
    required String key,
    required dynamic value,
  }) =>
      (io.newRequest('/v2/tariff/:id')
            ..put()
            ..path = {
              ':id': id,
            }
            ..model = _toMap(key, value))
          .execute();

  Map<String, dynamic> _toMap(
    String key,
    dynamic value,
  ) {
    Map<String, dynamic> t = {};
    t[key] = value;
    return t;
  }
}

class CreateTariff extends Equatable {
  final String title;
  final String description;
  final double price;
  final String name;
  final bool active;
  final String period;

  CreateTariff({
    required this.title,
    required this.description,
    required this.price,
    required this.name,
    required this.active,
    required this.period,
  });

  List<Object?> get props => [
        this.title,
        this.description,
        this.price,
        this.name,
        this.active,
        this.period,
      ];

  factory CreateTariff.fromJson(Map<String, dynamic> json) =>
      _$CreateTariffFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTariffToJson(this);
}

CreateTariff _$CreateTariffFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CreateTariff',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'title',
            'description',
            'price',
            'name',
            'active',
            'period'
          ],
        );
        final val = CreateTariff(
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
          name: $checkedConvert('name', (v) => v as String),
          active: $checkedConvert('active', (v) => v as bool),
          period: $checkedConvert('period', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$CreateTariffToJson(CreateTariff instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'name': instance.name,
      'active': instance.active,
      'period': instance.period,
    };

class Tariff extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String name;
  final bool active;
  final String period;
  final String createdAt;
  final String updatedAt;

  Tariff({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.name,
    required this.active,
    required this.period,
    required this.createdAt,
    required this.updatedAt,
  });

  List<Object?> get props => [
        this.id,
        this.title,
        this.description,
        this.price,
        this.name,
        this.active,
        this.period,
        this.createdAt,
        this.updatedAt,
      ];

  factory Tariff.fromJson(Map<String, dynamic> json) => _$TariffFromJson(json);

  Map<String, dynamic> toJson() => _$TariffToJson(this);
}

Tariff _$TariffFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Tariff',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'title',
            'description',
            'price',
            'name',
            'active',
            'period',
            'createdAt',
            'updatedAt'
          ],
        );
        final val = Tariff(
          id: $checkedConvert('id', (v) => v as int),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
          name: $checkedConvert('name', (v) => v as String),
          active: $checkedConvert('active', (v) => v as bool),
          period: $checkedConvert('period', (v) => v as String),
          createdAt: $checkedConvert('createdAt', (v) => v as String),
          updatedAt: $checkedConvert('updatedAt', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$TariffToJson(Tariff instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'name': instance.name,
      'active': instance.active,
      'period': instance.period,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
