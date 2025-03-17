import 'package:feature_counter/feature_counter.dart' as counter;
import 'package:hello_world/ecommerce_feature.dart';
import 'package:sanity_client/config.dart';
import 'package:vyuh_core/vyuh_core.dart' as vc;
import 'package:vyuh_extension_content/plugin/content_plugin.dart';
import 'package:vyuh_feature_developer/vyuh_feature_developer.dart'
    as developer;
import 'package:vyuh_feature_system/vyuh_feature_system.dart' as system;
import 'package:vyuh_plugin_content_provider_sanity/vyuh_plugin_content_provider_sanity.dart';

import 'blog_feature.dart';

void main() async {
  vc.runApp(
    initialLocation: '/ecommerce',
    features:
        () => [
          system.feature,
          developer.feature,
          counter.feature,
          blogFeature,
          ecommerceFeature,
        ],
    plugins: vc.PluginDescriptor(
      content: DefaultContentPlugin(
        useLiveRoute: false,
        provider: SanityContentProvider.withConfig(
          config: SanityConfig(
            projectId: 'x5y1sweb',
            dataset: 'production',
            useCdn: false,
            perspective: Perspective.drafts,
            token:
                'sk8VRGkX7kHvcNcUvon1JB3rgg2fDxmokUoGbXa78SduTDQYt7OkDL0JtsU35WZppssYNwanYoay7dBjAiJANjgMACcZnXs49HXZjFztU3kxPVNUx7g3ArF5vtNuB4KG4ECE0KW5hTXZc1u74sfVKO4nbJZ8SK1a7OH50WgUqyYtKYrDSM4d',
          ),
          cacheDuration: const Duration(seconds: 1),
        ),
      ),
    ),
  );
}
