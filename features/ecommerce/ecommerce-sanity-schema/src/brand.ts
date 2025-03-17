import { defineField, defineType, SchemaTypeDefinition } from 'sanity';
import { IoBag as Icon } from 'react-icons/io5';

const schemaName = 'ecommerce.brand';

export const brand: SchemaTypeDefinition = defineType({
  name: schemaName,
  title: 'Brand',
  type: 'document',
  icon: Icon,
  fields: [
    defineField({
      name: 'title',
      title: 'Title',
      type: 'string',
    }),
    defineField({
      name: 'description',
      title: 'Description',
      type: 'string',
    }),
    defineField({
      name: 'image',
      title: 'Image',
      type: 'image',
    }),
    defineField({
      name: 'slug',
      title: 'Slug',
      type: 'slug',
      options: {
        source: 'title',
        maxLength: 96,
      },
    }),
  ],
  preview: {
    select: {
      title: 'title',
      description: 'description',
      image: 'image',
    },
    prepare(selection: any) {
      return {
        title: `Brand: (${selection.title ?? 'N/A'})`,
        subtitle: selection.description,
        media: selection.image,
      };
    },
  },
});
