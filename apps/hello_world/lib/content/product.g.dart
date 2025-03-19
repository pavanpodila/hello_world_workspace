// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  title: json['title'] as String,
  description:
      json['description'] == null
          ? null
          : PortableTextContent.fromJson(
            json['description'] as Map<String, dynamic>,
          ),
  skuId: json['skuId'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ImageReference.fromJson(e as Map<String, dynamic>))
          .toList(),
  slug:
      json['slug'] == null
          ? null
          : Slug.fromJson(json['slug'] as Map<String, dynamic>),
  brand:
      json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
  category:
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
  layout: typeFromFirstOfListJson(json['layout']),
  modifiers: ContentItem.modifierList(json['modifiers']),
);

Slug _$SlugFromJson(Map<String, dynamic> json) =>
    Slug(current: json['current'] as String);

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
  title: json['title'] as String,
  description: json['description'] as String?,
  image:
      json['image'] == null
          ? null
          : ImageReference.fromJson(json['image'] as Map<String, dynamic>),
  slug:
      json['slug'] == null
          ? null
          : Slug.fromJson(json['slug'] as Map<String, dynamic>),
);

EcommerceCategory _$EcommerceCategoryFromJson(Map<String, dynamic> json) =>
    EcommerceCategory(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
    );
