import 'package:json_annotation/json_annotation.dart';
import 'package:vyuh_core/vyuh_core.dart';
import 'package:vyuh_feature_system/content/index.dart';

part 'blog_post.g.dart';

@JsonSerializable(createToJson: false)
final class Slug {
  final String current;

  Slug({required this.current});

  factory Slug.fromJson(Map<String, dynamic> json) => _$SlugFromJson(json);
}

@JsonSerializable(createToJson: false)
final class BlogPost {
  final String title;
  final String? description;
  final Slug? slug;
  final List<Author> authors;
  final PortableTextContent content; // vyuh.portableText type
  final ImageReference? bannerImage;
  final DateTime? date;
  final List<String>? tags;
  final Category? category;

  BlogPost({
    required this.title,
    required this.description,
    required this.slug,
    this.authors = const [],
    required this.content,
    this.bannerImage,
    required this.date,
    required this.tags,
    required this.category,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) =>
      _$BlogPostFromJson(json);
}

@JsonSerializable(createToJson: false)
final class Author {
  final String name;
  final String? bio;
  final ImageReference? avatar;
  final Socials? socials;

  Author({required this.name, this.bio, this.avatar, this.socials});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}

@JsonSerializable(createToJson: false)
final class Socials {
  final String? github;
  final String? linkedin;
  final String? instagram;
  final String? twitter;

  Socials({this.github, this.linkedin, this.instagram, this.twitter});

  factory Socials.fromJson(Map<String, dynamic> json) =>
      _$SocialsFromJson(json);
}

@JsonSerializable(createToJson: false)
final class Category {
  final String identifier;
  final String title;

  Category({required this.identifier, required this.title});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
