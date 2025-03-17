import 'package:hello_world/content/ecommerce_api_configuration.dart';
import 'package:vyuh_core/vyuh_core.dart';
import 'package:vyuh_extension_content/vyuh_extension_content.dart';
import 'package:vyuh_feature_system/content/api_content.dart';

final ecommerceFeature = FeatureDescriptor(
  name: 'ecommerce',
  title: 'E-commerce',
  description: 'Schema for the E-commerce feature',
  routes: () async {
    return [CMSRoute(path: '/ecommerce')];
  },
  extensions: [
    ContentExtensionDescriptor(
      contents: [
        APIContentDescriptor(
          configurations: [EcommerceApiConfiguration.typeDescriptor],
        ),
      ],
    ),
  ],
);
