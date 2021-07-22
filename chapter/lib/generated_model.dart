import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated_model.g.dart';

@JsonSerializable()
class TocItem extends Equatable {
  final int id;
  final String title;
  final int visible;
  final int position;
  final String publishedAt;
  final String updatedAt;
  final bool images;
  final bool read;
  final int payed;
  final double price;
  final bool purchase;

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
      ];

  factory TocItem.fromJson(Map<String, dynamic> json) =>
      _$TocItemFromJson(json);

  Map<String, dynamic> toJson() => _$TocItemToJson(this);
}

@JsonSerializable()
class Revision extends Equatable {
  final int id;
  final int version;
  final String revisionComment;
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

@JsonSerializable()
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

@JsonSerializable()
class Device extends Equatable {
  final String deviceId;
  final String userAgent;
  final String platform;
  final String browser;

  Device({
    required this.deviceId,
    required this.userAgent,
    required this.platform,
    required this.browser,
  });

  List<Object?> get props => [
        this.deviceId,
        this.userAgent,
        this.platform,
        this.browser,
      ];

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

@JsonSerializable()
class Chapter extends Equatable {
  final int id;
  final String title;
  final int visible;
  final int position;
  final Revision revision;
  final String beforeComment;
  final String afterComment;
  final String publishedAt;
  final String createdAt;
  final String updatedAt;

  Chapter({
    required this.id,
    required this.title,
    required this.visible,
    required this.position,
    required this.revision,
    required this.beforeComment,
    required this.afterComment,
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

@JsonSerializable()
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

@JsonSerializable()
class GetChapter extends Equatable {
  final List<int> chapters;
  final int bookId;
  final String format;
  final String theme;

  GetChapter({
    required this.chapters,
    required this.bookId,
    required this.format,
    required this.theme,
  });

  List<Object?> get props => [
        this.chapters,
        this.bookId,
        this.format,
        this.theme,
      ];

  factory GetChapter.fromJson(Map<String, dynamic> json) =>
      _$GetChapterFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'c': this.chapters,
        'b': this.bookId,
        'f': this.format,
        't': this.theme,
      };
}

@JsonSerializable()
class Manifest extends Equatable {
  final Metadata metadata;
  final List<int> bookmarks;
  final PricingStrategy pricing;

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

@JsonSerializable()
class PricingStrategy extends Equatable {
  final int id;
  final int price;
  final int state;
  final String createdAt;
  final String updatedAt;

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

@JsonSerializable()
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
