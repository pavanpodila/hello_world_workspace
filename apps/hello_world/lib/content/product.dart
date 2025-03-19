import 'package:json_annotation/json_annotation.dart';
import 'package:vyuh_core/vyuh_core.dart';
import 'package:vyuh_feature_system/content/index.dart';

part 'product.g.dart';

@JsonSerializable(createToJson: false)
final class Product extends ContentItem {
  static const schemaName = 'ecommerce.product';

  final String title;
  final PortableTextContent? description;
  final String? skuId;
  final double? price;
  final List<ImageReference>? images;
  final Slug? slug;
  final Brand? brand;
  final Category? category;

  Product({
    required this.title,
    this.description,
    this.skuId,
    this.price,
    this.images,
    this.slug,
    this.brand,
    this.category,
    super.layout,
    super.modifiers,
  }) : super(schemaType: schemaName);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@JsonSerializable(createToJson: false)
final class Slug {
  final String current;

  Slug({required this.current});

  factory Slug.fromJson(Map<String, dynamic> json) => _$SlugFromJson(json);
}

@JsonSerializable(createToJson: false)
final class Brand {
  static const schemaName = 'ecommerce.brand';

  final String title;
  final String? description;
  final ImageReference? image;
  final Slug? slug;

  Brand({required this.title, this.description, this.image, this.slug});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}

@JsonSerializable(createToJson: false)
final class EcommerceCategory {
  static const schemaName = 'ecommerce.category';

  final String identifier;
  final String title;

  EcommerceCategory({required this.identifier, required this.title});

  factory EcommerceCategory.fromJson(Map<String, dynamic> json) =>
      _$EcommerceCategoryFromJson(json);
}
