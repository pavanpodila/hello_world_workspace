import { defineField, defineType } from 'sanity';

export const productApiConfiguration = defineType({
  name: 'ecommerce.apiConfiguration',
  title: 'Ecommerce API Configuration',
  type: 'object',
  fields: [
    defineField({
      name: 'documentType',
      title: 'Document Type',
      type: 'string',
      initialValue: 'ecommerce.product',
      options: {
        list: [
          { title: 'Product', value: 'ecommerce.product' },
          { title: 'Brand', value: 'ecommerce.brand' },
          { title: 'Category', value: 'ecommerce.category' },
        ],
      },
    }),
  ],
  preview: {
    select: {
      documentType: 'documentType',
    },
    prepare(selection: any) {
      return {
        title: `E-commerce API`,
        subtitle: selection.documentType ?? '---',
      };
    },
  },
});
