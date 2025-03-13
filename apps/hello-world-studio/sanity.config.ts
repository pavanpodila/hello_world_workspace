import { defineConfig, defineField, defineType } from 'sanity';
import { schemaTypes } from './schemaTypes';
import { vyuh } from '@vyuh/sanity-plugin-structure';
import { DocumentViewDescriptor, system } from '@vyuh/sanity-schema-system';
import {
  FeatureDescriptor,
  BuiltContentSchemaBuilder,
} from '@vyuh/sanity-schema-core';
import { blogPost } from './documents/blogPost';
import { blogCategory } from './documents/category';
import { blogAuthor } from './documents/author';

const blogFeature = new FeatureDescriptor({
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

export default defineConfig({
  name: 'default',
  title: 'hello-world-studio',

  projectId: 'x5y1sweb',
  dataset: 'production',

  plugins: [
    vyuh({
      features: [system, blogFeature],
    }),
  ],

  schema: {
    types: schemaTypes,
  },
});
