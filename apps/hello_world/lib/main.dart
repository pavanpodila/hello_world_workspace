import 'package:feature_counter/feature_counter.dart' as counter;
import 'package:flutter/material.dart';
import 'package:hello_world/documents/blog_post.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sanity_client/config.dart';
import 'package:vyuh_core/vyuh_core.dart' as vc;
import 'package:vyuh_extension_content/content_extension_descriptor.dart';
import 'package:vyuh_extension_content/plugin/content_plugin.dart';
import 'package:vyuh_feature_developer/vyuh_feature_developer.dart'
    as developer;
import 'package:vyuh_feature_system/vyuh_feature_system.dart' as system;
import 'package:vyuh_plugin_content_provider_sanity/vyuh_plugin_content_provider_sanity.dart';

final blogFeature = vc.FeatureDescriptor(
  name: 'blog',
  title: 'My Blogs',
  routes: () => [vc.CMSRoute(path: '/blog'), vc.CMSRoute(path: '/blog/:id')],
  extensions: [
    ContentExtensionDescriptor(
      contents: [
        system.DocumentViewDescriptor(layouts: [BlogPostLayout.typeDescriptor]),
      ],
    ),
  ],
);

@JsonSerializable()
final class BlogPostLayout extends vc.LayoutConfiguration<system.DocumentView> {
  static const schemaName = 'blogPost.layout.default';

  BlogPostLayout() : super(schemaType: schemaName);

  static final typeDescriptor = vc.TypeDescriptor(
    schemaType: schemaName,
    fromJson: BlogPostLayout.fromJson,
    title: 'Default Blog Post layout',
  );

  factory BlogPostLayout.fromJson(Map<String, dynamic> json) =>
      BlogPostLayout();

  @override
  Widget build(BuildContext context, system.DocumentView content) {
    return FutureBuilder(
      future:
          content.reference?.ref == null
              ? null
              : vc.vyuh.content.provider.fetchSingle(
                '''
*[_type == "blogPost" && _id == \$id]{
  ...,
  authors[]->,
  category->
  
}[0]
              ''',
                queryParams: {'id': content.reference!.ref},
                fromJson: BlogPost.fromJson,
              ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return vc.vyuh.widgetBuilder.contentLoader(context);
        }

        if (snapshot.hasError) {
          return vc.vyuh.widgetBuilder.errorView(
            context,
            error: snapshot.error,
            title: 'Error loading blog post',
          );
        }

        if (snapshot.data == null) {
          return const Text('No data');
        }

        // render the blog post
        final blogPost = snapshot.data as BlogPost;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                blogPost.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(blogPost.description ?? ''),
              system.ContentImage(
                ref: blogPost.bannerImage,
                height: 200,
                fit: BoxFit.contain,
              ),

              Text('Category: ${blogPost.category?.title ?? ''}'),
              Text(
                'Published on: ${blogPost.date?.toLocal().toString() ?? ''}',
              ),
              for (final author in blogPost.authors)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 4,
                  children: [
                    system.ContentImage(
                      ref: author.avatar,
                      height: 32,
                      width: 32,
                      fit: BoxFit.contain,
                    ),
                    Expanded(child: Text(author.name)),
                  ],
                ),
              vc.vyuh.content.buildContent(context, blogPost.content),
            ],
          ),
        );
      },
    );
  }
}

void main() async {
  vc.runApp(
    initialLocation: '/blog/details',
    features:
        () => [system.feature, developer.feature, counter.feature, blogFeature],
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
