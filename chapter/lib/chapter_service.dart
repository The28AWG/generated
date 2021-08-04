import 'dart:async';

import 'package:dark_novels_io/io.dart';
import 'package:equatable/equatable.dart';
import 'package:jiffy/jiffy.dart';
import 'package:json_annotation/json_annotation.dart';

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
            ..query = model)
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

class GetChapter extends Equatable {
  final int chapterId;
  final int bookId;
  final String? format;
  final String? theme;

  GetChapter({
    required this.chapterId,
    required this.bookId,
    this.format,
    this.theme,
  });

  List<Object?> get props => [
        this.chapterId,
        this.bookId,
        this.format,
        this.theme,
      ];

  factory GetChapter.fromJson(Map<String, dynamic> json) =>
      _$GetChapterFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'c[]': chapterId,
        'b': this.bookId,
        'f': this.format,
        't': this.theme,
      };
}

GetChapter _$GetChapterFromJson(Map<String, dynamic> json) => $checkedCreate(
      'GetChapter',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['chapterId', 'bookId', 'format', 'theme'],
        );
        final val = GetChapter(
          chapterId: $checkedConvert('chapterId', (v) => v as int),
          bookId: $checkedConvert('bookId', (v) => v as int),
          format: $checkedConvert('format', (v) => v as String),
          theme: $checkedConvert('theme', (v) => v as String),
        );
        return val;
      },
    );

class Manifest extends Equatable {
  final Metadata metadata;
  final List<int>? bookmarks;
  final PricingStrategy? pricing;

  Manifest({
    required this.metadata,
    required this.bookmarks,
    required this.pricing,
  });

  List<Object?> get props => [
        this.metadata,
        this.bookmarks,
        this.pricing,
      ];

  factory Manifest.fromJson(Map<String, dynamic> json) =>
      _$ManifestFromJson(json);

  Map<String, dynamic> toJson() => _$ManifestToJson(this);
}

Manifest _$ManifestFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Manifest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['metadata', 'bookmarks', 'pricing'],
        );
        final val = Manifest(
          metadata: $checkedConvert(
              'metadata', (v) => Metadata.fromJson(v as Map<String, dynamic>)),
          bookmarks: $checkedConvert('bookmarks',
              (v) => (v as List<dynamic>?)?.map((e) => e as int).toList()),
          pricing: $checkedConvert(
              'pricing',
              (v) => v == null
                  ? null
                  : PricingStrategy.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ManifestToJson(Manifest instance) => <String, dynamic>{
      'metadata': instance.metadata.toJson(),
      'bookmarks': instance.bookmarks,
      'pricing': instance.pricing?.toJson(),
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
      'PricingStrategy',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['id', 'price', 'state', 'createdAt', 'updatedAt'],
        );
        final val = PricingStrategy(
          id: $checkedConvert('id', (v) => v as int),
          price: $checkedConvert('price', (v) => v as double),
          state: $checkedConvert('state', (v) => v as int),
          createdAt: Jiffy($checkedConvert('createdAt', (v) => v as String)),
          updatedAt: Jiffy($checkedConvert('updatedAt', (v) => v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$PricingStrategyToJson(PricingStrategy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'state': instance.state,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

class BaseBook extends Equatable {
  final int id;
  final String bookTitle;
  final String authors;
  final String cover;
  final int state;
  final String slug;

  BaseBook({
    required this.id,
    required this.bookTitle,
    required this.authors,
    required this.cover,
    required this.state,
    required this.slug,
  });

  List<Object?> get props => [
        this.id,
        this.bookTitle,
        this.authors,
        this.cover,
        this.state,
        this.slug,
      ];

  factory BaseBook.fromJson(Map<String, dynamic> json) =>
      _$BaseBookFromJson(json);

  Map<String, dynamic> toJson() => _$BaseBookToJson(this);
}

BaseBook _$BaseBookFromJson(Map<String, dynamic> json) => $checkedCreate(
      'BaseBook',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'bookTitle',
            'authors',
            'cover',
            'state',
            'slug'
          ],
        );
        final val = BaseBook(
          id: $checkedConvert('id', (v) => v as int),
          bookTitle: $checkedConvert('bookTitle', (v) => v as String),
          authors: $checkedConvert('authors', (v) => v as String),
          cover: $checkedConvert('cover', (v) => v as String),
          state: $checkedConvert('state', (v) => v as int),
          slug: $checkedConvert('slug', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$BaseBookToJson(BaseBook instance) => <String, dynamic>{
      'id': instance.id,
      'bookTitle': instance.bookTitle,
      'authors': instance.authors,
      'cover': instance.cover,
      'state': instance.state,
      'slug': instance.slug,
    };

class Metadata extends Equatable {
  final BaseBook book;
  final List<Chapter> chapters;

  Metadata({
    required this.book,
    required this.chapters,
  });

  List<Object?> get props => [
        this.book,
        this.chapters,
      ];

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

Metadata _$MetadataFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Metadata',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['book', 'chapters'],
        );
        final val = Metadata(
          book: $checkedConvert(
              'book', (v) => BaseBook.fromJson(v as Map<String, dynamic>)),
          chapters: $checkedConvert(
              'chapters',
              (v) => v is Map<String, dynamic>
                  ? [Chapter.fromJson(v)]
                  : (v as List<dynamic>)
                      .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
                      .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'book': instance.book.toJson(),
      'chapters': instance.chapters.map((e) => e.toJson()).toList(),
    };

class Chapter extends Equatable {
  final int id;
  final String title;
  final int visible;
  final int position;
  final Revision revision;
  final String? beforeComment;
  final String? afterComment;
  final String publishedAt;
  final String createdAt;
  final String updatedAt;

  Chapter({
    required this.id,
    required this.title,
    required this.visible,
    required this.position,
    required this.revision,
    this.beforeComment,
    this.afterComment,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  List<Object?> get props => [
        this.id,
        this.title,
        this.visible,
        this.position,
        this.revision,
        this.beforeComment,
        this.afterComment,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
      ];

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}

Chapter _$ChapterFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Chapter',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'title',
            'visible',
            'position',
            'revision',
            'beforeComment',
            'afterComment',
            'publishedAt',
            'createdAt',
            'updatedAt'
          ],
        );
        final val = Chapter(
          id: $checkedConvert('id', (v) => v as int),
          title: $checkedConvert('title', (v) => v as String),
          visible: $checkedConvert('visible', (v) => v as int),
          position: $checkedConvert('position', (v) => v as int),
          revision: $checkedConvert(
              'revision', (v) => Revision.fromJson(v as Map<String, dynamic>)),
          beforeComment: $checkedConvert('beforeComment', (v) => v as String),
          afterComment: $checkedConvert('afterComment', (v) => v as String),
          publishedAt: $checkedConvert('publishedAt', (v) => v as String),
          createdAt: $checkedConvert('createdAt', (v) => v as String),
          updatedAt: $checkedConvert('updatedAt', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'visible': instance.visible,
      'position': instance.position,
      'revision': instance.revision.toJson(),
      'beforeComment': instance.beforeComment,
      'afterComment': instance.afterComment,
      'publishedAt': instance.publishedAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

class Revision extends Equatable {
  final int id;
  final int version;
  final String? revisionComment;
  final bool images;
  final String createdAt;

  Revision({
    required this.id,
    required this.version,
    required this.revisionComment,
    required this.images,
    required this.createdAt,
  });

  List<Object?> get props => [
        this.id,
        this.version,
        this.revisionComment,
        this.images,
        this.createdAt,
      ];

  factory Revision.fromJson(Map<String, dynamic> json) =>
      _$RevisionFromJson(json);

  Map<String, dynamic> toJson() => _$RevisionToJson(this);
}

Revision _$RevisionFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Revision',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'version',
            'revisionComment',
            'images',
            'createdAt'
          ],
        );
        final val = Revision(
          id: $checkedConvert('id', (v) => v as int),
          version: $checkedConvert('version', (v) => v as int),
          revisionComment:
              $checkedConvert('revisionComment', (v) => v as String),
          images: $checkedConvert('images', (v) => v as bool?) ?? false,
          createdAt: $checkedConvert('createdAt', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$RevisionToJson(Revision instance) => <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'revisionComment': instance.revisionComment,
      'images': instance.images,
      'createdAt': instance.createdAt,
    };
