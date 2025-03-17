import {
  BuiltContentSchemaBuilder,
  DefaultFieldsModifier,
  FeatureDescriptor,
} from '@vyuh/sanity-schema-core';
import { ProductSchemaBuilder } from './product.ts';
import { brand } from './brand.ts';
import { category } from './category.ts';
import { APIContentDescriptor } from '@vyuh/sanity-schema-system';
import { productApiConfiguration } from './product-api-configuration.ts';

export const ecommerce = new FeatureDescriptor({
  name: 'ecommerce',
  title: 'E-commerce',
  description: 'Schema for the E-commerce feature',
  contents: [
    new APIContentDescriptor({
      configurations: [productApiConfiguration],
    }),
  ],
  contentSchemaBuilders: [
    new ProductSchemaBuilder(),
    new BuiltContentSchemaBuilder(brand),
    new BuiltContentSchemaBuilder(category),
  ],
  contentSchemaModifiers: [
    new DefaultFieldsModifier({
      excludedSchemaTypes: [
        { type: 'ecommerce.product' },
        { type: 'ecommerce.brand' },
        { type: 'ecommerce.category' },
      ],
    }),
  ],
});
