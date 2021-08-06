import 'dart:async';

import 'package:dark_novels_io/io.dart';
import 'package:equatable/equatable.dart';
import 'package:jiffy/jiffy.dart';
import 'package:json_annotation/json_annotation.dart';

class ChapterBuyService {
  final DarkIO io;

  ChapterBuyService(
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

  Future<Response> createPricingStrategy({
    required String type,
    required double price,
  }) =>
      (io.newRequest('/v2/buy/:type/')
            ..post()
            ..path = {
              ':type': type,
            }
            ..model = _toMap('price', price))
          .execute();

  Map<String, dynamic> _toMap(
    String key,
    dynamic value,
  ) {
    Map<String, dynamic> t = {};
    t[key] = value;
    return t;
  }

  Future<Response> createBatchPricingStrategy({
    required CreateBatchPricingStrategy model,
  }) =>
      (io.newRequest('/v2/buy/')
            ..post()
            ..model = model)
          .execute();

  Future<Response> updatePricingStrategy({
    required String type,
    required int id,
    required String key,
    required dynamic value,
  }) =>
      (io.newRequest('/v2/buy/:type/:id')
            ..put()
            ..path = {
              ':type': type,
              ':id': id,
            }
            ..model = _toMap(key, value))
          .execute();

  Future<Response> getPricingStrategy({
    required String type,
    required int id,
  }) =>
      (io.newRequest('/v2/buy/:type/:id')
            ..get()
            ..path = {
              ':type': type,
              ':id': id,
            })
          .execute();
}

class CreateBatchPricingStrategy extends Equatable {
  final double price;
  final int state;
  final List<int> ids;

  CreateBatchPricingStrategy({
    required this.price,
    required this.state,
    required this.ids,
  });

  List<Object?> get props => [
        this.price,
        this.state,
        this.ids,
      ];

  factory CreateBatchPricingStrategy.fromJson(Map<String, dynamic> json) =>
      _$CreateBatchPricingStrategyFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBatchPricingStrategyToJson(this);
}

CreateBatchPricingStrategy _$CreateBatchPricingStrategyFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'CreateBatchPricingStrategy',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['price', 'state', 'ids'],
        );
        final val = CreateBatchPricingStrategy(
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
          state: $checkedConvert('state', (v) => v as int),
          ids: $checkedConvert(
              'ids', (v) => (v as List<dynamic>).map((e) => e as int).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$CreateBatchPricingStrategyToJson(
        CreateBatchPricingStrategy instance) =>
    <String, dynamic>{
      'price': instance.price,
      'state': instance.state,
      'ids': instance.ids,
    };

class PricingStrategy extends Equatable {
  final int id;
  final double price;
  final int state;
  final Jiffy createdAt;
  final Jiffy updatedAt;

  PricingStrategy({
    required this.id,
    required this.price,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
  });

  List<Object?> get props => [
        this.id,
        this.price,
        this.state,
        this.createdAt,
        this.updatedAt,
      ];

  factory PricingStrategy.fromJson(Map<String, dynamic> json) =>
      _$PricingStrategyFromJson(json);

  Map<String, dynamic> toJson() => _$PricingStrategyToJson(this);
}

PricingStrategy _$PricingStrategyFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CreateBatchPricingStrategy',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'price',
            'state',
            'createdAt',
            'updatedAt',
          ],
        );
        final val = PricingStrategy(
          id: $checkedConvert('id', (v) => v as int),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
          state: $checkedConvert('state', (v) => v as int),
          createdAt: $checkedConvert('createdAt', (v) => Jiffy(v as String)),
          updatedAt: $checkedConvert('updatedAt', (v) => Jiffy(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$PricingStrategyToJson(PricingStrategy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'state': instance.state,
      'createdAt': instance.createdAt.toString(),
      'updatedAt': instance.updatedAt.toString(),
    };
