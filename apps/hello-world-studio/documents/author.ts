import { defineField, defineType } from 'sanity';

export const blogAuthor = defineType({
  name: 'author',
  title: 'Author',
  type: 'document',
  fields: [
    defineField({
      name: 'name',
      title: 'Name',
      type: 'string',
    }),
    defineField({
      name: 'bio',
      title: 'Bio',
      type: 'text',
    }),
    defineField({
      name: 'avatar',
      title: 'Avatar',
      type: 'image',
    }),
    defineField({
      name: 'socials',
      type: 'object',
      fields: [
        defineField({
          name: 'github',
          title: 'Github',
          type: 'string',
        }),
        defineField({
          name: 'linkedin',
          title: 'Linkedin',
          type: 'string',
        }),
        defineField({
          name: 'instagram',
          title: 'Instagram',
          type: 'string',
        }),
        defineField({
          name: 'twitter',
          title: 'Twitter',
          type: 'string',
        }),
      ],
    }),
  ],
  preview: {
    select: {
      title: 'title',
      subtitle: 'bio',
      media: 'avatar',
    },
  },
});
