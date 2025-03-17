import { defineConfig } from 'sanity';
import { schemaTypes } from './schemaTypes';
import { vyuh } from '@vyuh/sanity-plugin-structure';
import { system } from '@vyuh/sanity-schema-system';
import { blogFeature } from './blogFeature';
import { ecommerce } from 'ecommerce-sanity-schema';

export default defineConfig({
  name: 'default',
  title: 'hello-world-studio',

  projectId: 'x5y1sweb',
  dataset: 'production',

  plugins: [
    vyuh({
      features: [system, blogFeature, ecommerce],
    }),
  ],

  schema: {
    types: schemaTypes,
  },
});
