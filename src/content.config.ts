import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

// Published newsletter posts live as Markdown files directly in
// src/content/newsletter/ (e.g. 2026-01-spring-update.md). Work-in-progress
// posts belong in src/content/newsletter/drafts/ so they're excluded from
// this glob (and from the build) until they're moved up a directory.
// Images referenced from a post can live in src/content/newsletter/images/.
const newsletter = defineCollection({
  loader: glob({ pattern: "*.md", base: "./src/content/newsletter" }),
  schema: z.object({
    title: z.string(),
    summary: z.string(),
    publishDate: z.coerce.date(),
    category: z.string().optional(),
    heroImage: z.string().optional(),
    author: z.string().optional(),
  }),
});

export const collections = { newsletter };
