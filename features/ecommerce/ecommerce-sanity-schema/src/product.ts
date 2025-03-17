import {
  ContentDescriptor,
  ContentSchemaBuilder,
} from '@vyuh/sanity-schema-core';
import { defineField, defineType, SchemaTypeDefinition } from 'sanity';
import { IoBag as Icon } from 'react-icons/io5';

export class ProductDescriptor extends ContentDescriptor {
  static schemaName = 'ecommerce.product';

  constructor(props?: Partial<ProductDescriptor>) {
    super(ProductDescriptor.schemaName, props ?? {});
  }
}

export class ProductSchemaBuilder extends ContentSchemaBuilder {
  schema: SchemaTypeDefinition = defineType({
    name: ProductDescriptor.schemaName,
    title: 'Product',
    type: 'document',
    icon: Icon,
    fields: [
      defineField({
        name: 'title',
        title: 'Title',
        type: 'string',
      }),
      defineField({
        name: 'slug',
        title: 'Slug',
        type: 'slug',
        options: {
          maxLength: 96,
          source: 'title',
        },
      }),
      defineField({
        name: 'description',
        title: 'Description',
        type: 'vyuh.portableText',
      }),
      defineField({
        name: 'skuId',
        title: 'SKU ID',
        type: 'string',
      }),
      defineField({
        name: 'price',
        title: 'Price',
        type: 'number',
      }),
      defineField({
        name: 'images',
        title: 'Images',
        type: 'array',
        of: [{ type: 'image' }],
      }),
      defineField({
        name: 'brand',
        title: 'Brand',
        type: 'reference',
        to: [{ type: 'ecommerce.brand' }],
      }),
      defineField({
        name: 'category',
        title: 'Category',
        type: 'reference',
        to: [{ type: 'ecommerce.category' }],
      }),
    ],
    preview: {
      select: {
        title: 'title',
        price: 'price',
        image: 'images.0.asset',
      },
      prepare(selection: any) {
        return {
          title: `Product: (${selection.title ?? 'N/A'})`,
          subtitle: selection.price,
          media: selection.image,
        };
      },
    },
  });

  constructor() {
    super(ProductDescriptor.schemaName);
  }

  build(descriptors: ContentDescriptor[]) {
    return this.schema;
  }
}
