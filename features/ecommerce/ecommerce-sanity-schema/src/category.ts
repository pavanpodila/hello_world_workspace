import { defineField, defineType } from 'sanity';

export const category = defineType({
  name: 'ecommerce.category',
  title: 'Category',
  type: 'document',
  fields: [
    defineField({
      name: 'identifier',
      title: 'Identifier',
      type: 'string',
    }),
    defineField({
      name: 'title',
      title: 'Title',
      type: 'string',
    }),
  ],
  preview: {
    select: {
      title: 'title',
      subtitle: 'identifier',
    },
  },
});
