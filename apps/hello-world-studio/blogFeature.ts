import {
  BuiltContentSchemaBuilder,
  FeatureDescriptor,
} from '@vyuh/sanity-schema-core';
import { DocumentViewDescriptor } from '@vyuh/sanity-schema-system';
import { defineField, defineType } from 'sanity';
import { blogPost } from './documents/blogPost';
import { blogCategory } from './documents/category';
import { blogAuthor } from './documents/author';

export const blogFeature = new FeatureDescriptor({
  name: 'blog',
  title: 'Blog',
  description: 'A blog feature',
  contents: [
    new DocumentViewDescriptor({
      documentTypes: [{ type: 'blogPost' }],
      layouts: [
        defineType({
          name: 'blogPost.layout.default',
          title: 'Default Blog Post layout',
          type: 'object',
          fields: [
            defineField({
              name: 'title',
              title: 'Title',
              type: 'string',
              readOnly: true,
              initialValue: 'Blog post layout',
            }),
          ],
        }),
      ],
    }),
  ],
  contentSchemaBuilders: [
    new BuiltContentSchemaBuilder(blogPost),
    new BuiltContentSchemaBuilder(blogCategory),
    new BuiltContentSchemaBuilder(blogAuthor),
  ],
});
