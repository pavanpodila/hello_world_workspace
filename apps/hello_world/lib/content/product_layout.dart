import 'package:flutter/material.dart';
import 'package:hello_world/content/product.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vyuh_core/vyuh_core.dart';
import 'package:vyuh_feature_system/ui/content_image.dart';

part 'product_layout.g.dart';

@JsonSerializable(createToJson: false)
final class ProductDefaultLayout extends LayoutConfiguration<Product> {
  static const schemaName = 'ecommerce.product.layout.default';

  static final typeDescriptor = TypeDescriptor(
    schemaType: schemaName,
    fromJson: ProductDefaultLayout.fromJson,
    // fromJson: ProductDefaultLayout.fromJson,
    title: 'Default Product layout',
  );

  ProductDefaultLayout() : super(schemaType: schemaName);

  factory ProductDefaultLayout.fromJson(Map<String, dynamic> json) =>
      _$ProductDefaultLayoutFromJson(json);

  @override
  Widget build(BuildContext context, Product content) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ContentImage(
              ref: content.images?.firstOrNull,
              height: 200,
              fit: BoxFit.contain,
            ),
            Text(content.title, style: theme.textTheme.titleLarge),
            Text('\$${content.price}', style: theme.textTheme.headlineMedium),
            Text(
              content.brand?.title ?? 'No brand',
              style: theme.textTheme.titleMedium,
            ),
            Text(
              content.category?.title ?? 'No Category',
              style: theme.textTheme.bodySmall,
            ),
            if (content.description != null)
              vyuh.content.buildContent(context, content.description!),
          ],
        ),
      ),
    );
  }
}

@JsonSerializable(createToJson: false)
final class ProductMiniLayout extends LayoutConfiguration<Product> {
  static const schemaName = 'ecommerce.product.layout.mini';

  static final typeDescriptor = TypeDescriptor(
    schemaType: schemaName,
    fromJson: ProductMiniLayout.fromJson,
    title: 'Mini Product layout',
  );

  ProductMiniLayout() : super(schemaType: schemaName);

  factory ProductMiniLayout.fromJson(Map<String, dynamic> json) =>
      _$ProductMiniLayoutFromJson(json);

  @override
  Widget build(BuildContext context, Product content) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContentImage(
              ref: content.images?.firstOrNull,
              width: 128,
              height: 128,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 8,
                children: [
                  Chip(label: Text('Mini')),
                  Text(
                    content.title,
                    style: theme.textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${content.price}',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    content.brand?.title ?? 'No brand',
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    content.category?.title ?? 'No Category',
                    style: theme.textTheme.bodySmall,
                  ),
                  if (content.description != null)
                    vyuh.content.buildContent(context, content.description!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
