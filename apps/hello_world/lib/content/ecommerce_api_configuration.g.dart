// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecommerce_api_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcommerceApiConfiguration _$EcommerceApiConfigurationFromJson(
  Map<String, dynamic> json,
) => EcommerceApiConfiguration(
  documentType: $enumDecode(
    _$EcommerceDocumentTypeEnumMap,
    json['documentType'],
  ),
);

const _$EcommerceDocumentTypeEnumMap = {
  EcommerceDocumentType.product: 'ecommerce.product',
  EcommerceDocumentType.brand: 'ecommerce.brand',
  EcommerceDocumentType.category: 'ecommerce.category',
};
