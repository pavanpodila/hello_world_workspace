// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slug _$SlugFromJson(Map<String, dynamic> json) =>
    Slug(current: json['current'] as String);

BlogPost _$BlogPostFromJson(Map<String, dynamic> json) => BlogPost(
  title: json['title'] as String,
  description: json['description'] as String?,
  slug:
      json['slug'] == null
          ? null
          : Slug.fromJson(json['slug'] as Map<String, dynamic>),
  authors:
      (json['authors'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  content: PortableTextContent.fromJson(
    json['content'] as Map<String, dynamic>,
  ),
  bannerImage:
      json['bannerImage'] == null
          ? null
          : ImageReference.fromJson(
            json['bannerImage'] as Map<String, dynamic>,
          ),
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  category:
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
);

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
  name: json['name'] as String,
  bio: json['bio'] as String?,
  avatar:
      json['avatar'] == null
          ? null
          : ImageReference.fromJson(json['avatar'] as Map<String, dynamic>),
  socials:
      json['socials'] == null
          ? null
          : Socials.fromJson(json['socials'] as Map<String, dynamic>),
);

Socials _$SocialsFromJson(Map<String, dynamic> json) => Socials(
  github: json['github'] as String?,
  linkedin: json['linkedin'] as String?,
  instagram: json['instagram'] as String?,
  twitter: json['twitter'] as String?,
);

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  identifier: json['identifier'] as String,
  title: json['title'] as String,
);
