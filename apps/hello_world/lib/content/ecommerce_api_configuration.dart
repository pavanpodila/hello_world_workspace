import 'package:flutter/material.dart';
import 'package:hello_world/content/product.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vyuh_core/vyuh_core.dart';
import 'package:vyuh_feature_system/content/api_content.dart';
import 'package:vyuh_feature_system/vyuh_feature_system.dart' hide Card;

part 'ecommerce_api_configuration.g.dart';

@JsonSerializable(createToJson: false)
final class EcommerceApiConfiguration extends ApiConfiguration<List<Product>> {
  static const schemaName = 'ecommerce.apiConfiguration';

  static final typeDescriptor = TypeDescriptor(
    schemaType: schemaName,
    fromJson: EcommerceApiConfiguration.fromJson,
    title: 'Ecommerce API Configuration',
  );

  final EcommerceDocumentType documentType;

  EcommerceApiConfiguration({required this.documentType})
    : super(schemaType: schemaName);

  factory EcommerceApiConfiguration.fromJson(Map<String, dynamic> json) =>
      _$EcommerceApiConfigurationFromJson(json);

  @override
  Widget build(BuildContext context, List<Product>? data) {
    if (data == null || data.isEmpty) {
      return vyuh.widgetBuilder.errorView(
        context,
        title: 'No Data',
        error: null,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _Product(content: data[index]);
        },
      ),
    );
  }

  @override
  Future<List<Product>?> invoke(BuildContext context) async {
    return vyuh.content.provider.fetchMultiple('''
*[_type == "${documentType.schemaName}"] {
  ...,
  brand->,
  category->,
}
''', fromJson: Product.fromJson);
  }
}

class _Product extends StatelessWidget {
  final Product content;

  const _Product({required this.content});

  Widget build(BuildContext context) {
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

enum EcommerceDocumentType {
  @JsonValue('ecommerce.product')
  product,

  @JsonValue('ecommerce.brand')
  brand,
  @JsonValue('ecommerce.category')
  category;

  String get schemaName => switch (this) {
    EcommerceDocumentType.product => Product.schemaName,
    EcommerceDocumentType.brand => Brand.schemaName,
    EcommerceDocumentType.category => EcommerceCategory.schemaName,
  };
}
