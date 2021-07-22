// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
          images: $checkedConvert('images', (v) => v as bool),
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
              (v) => (v as List<dynamic>)
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

GetChapter _$GetChapterFromJson(Map<String, dynamic> json) => $checkedCreate(
      'GetChapter',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['chapters', 'bookId', 'format', 'theme'],
        );
        final val = GetChapter(
          chapters: $checkedConvert('chapters',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          bookId: $checkedConvert('bookId', (v) => v as int),
          format: $checkedConvert('format', (v) => v as String),
          theme: $checkedConvert('theme', (v) => v as String),
        );
        return val;
      },
    );

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
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          pricing: $checkedConvert('pricing',
              (v) => PricingStrategy.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ManifestToJson(Manifest instance) => <String, dynamic>{
      'metadata': instance.metadata.toJson(),
      'bookmarks': instance.bookmarks,
      'pricing': instance.pricing.toJson(),
    };

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
          price: $checkedConvert('price', (v) => v as int),
          state: $checkedConvert('state', (v) => v as int),
          createdAt: $checkedConvert('createdAt', (v) => v as String),
          updatedAt: $checkedConvert('updatedAt', (v) => v as String),
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
