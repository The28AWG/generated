import 'dart:async';

import 'package:dark_novels_io/io.dart';
import 'package:equatable/equatable.dart';
import 'package:jiffy/jiffy.dart';
import 'package:json_annotation/json_annotation.dart';

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
            }
            ..attribute = {'type': List})
          .execute();
}

class TocItem extends Equatable {
  final int id;
  final String title;
  final int visible;
  final int position;
  final Jiffy publishedAt;
  final Jiffy updatedAt;
  final bool images;
  final bool read;
  final int payed;
  final double? price;
  final bool purchase;
  final bool volume;
  final bool publishedAtShow;

  TocItem({
    required this.id,
    required this.title,
    required this.visible,
    required this.position,
    required this.publishedAt,
    required this.updatedAt,
    required this.images,
    required this.read,
    required this.payed,
    required this.price,
    required this.purchase,
    required this.volume,
    required this.publishedAtShow,
  });

  List<Object?> get props => [
        this.id,
        this.title,
        this.visible,
        this.position,
        this.publishedAt,
        this.updatedAt,
        this.images,
        this.read,
        this.payed,
        this.price,
        this.purchase,
        this.volume,
        this.publishedAtShow,
      ];

  factory TocItem.fromJson(Map<String, dynamic> json) => _$custom(json);

  Map<String, dynamic> toJson() => {};
}

TocItem _$custom(Map<String, dynamic> json) => $checkedCreate(
      'TocItem',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'title',
            'visible',
            'position',
            'publishedAt',
            'updatedAt',
            'images',
            'read',
            'payed',
            'price',
            'purchase'
          ],
        );
        String title = $checkedConvert('title', (v) => v as String);
        bool volume = false;
        if (title.lastIndexOf('Volume:', 0) == 0) {
          title = title.substring(7);
          volume = true;
        }
        int? visible = $checkedConvert('visible', (v) => v as int?);
        if (visible == null) {
          visible = 2;
        }
        bool? images = $checkedConvert('images', (v) => v as bool?);
        if (images == null) {
          images = false;
        }
        bool? read = $checkedConvert('read', (v) => v as bool?);
        if (read == null) {
          read = false;
        }
        int? payed = $checkedConvert('payed', (v) => v as int?);
        if (payed == null) {
          payed = 0;
        }
        double? price =
            $checkedConvert('price', (v) => (v as num?)?.toDouble());
        if (price == null) {
          price = 0.0;
        }
        bool? purchase = $checkedConvert('purchase', (v) => v as bool?);
        if (purchase == null) {
          purchase = false;
        }
        Jiffy publishedAt = Jiffy(
          $checkedConvert('publishedAt', (v) => v as String),
        );
        bool publishedAtShow = publishedAt.isAfter(Jiffy());
        Jiffy updatedAt = Jiffy(
          $checkedConvert('updatedAt', (v) => v as String),
        );
        final val = TocItem(
            id: $checkedConvert('id', (v) => v as int),
            title: title,
            visible: visible,
            position: $checkedConvert('position', (v) => v as int),
            publishedAt: publishedAt,
            updatedAt: updatedAt,
            images: images,
            read: read,
            payed: payed,
            price: price,
            purchase: purchase,
            volume: volume,
            publishedAtShow: publishedAtShow);
        return val;
      },
    );
