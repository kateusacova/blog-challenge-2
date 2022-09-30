TRUNCATE posts, tags, posts_tags RESTART IDENTITY;

INSERT INTO "public"."posts" ("id", "title") VALUES
(1, 'How to use Git'),
(2, 'Ruby classes');

INSERT INTO "public"."tags" ("id", "name") VALUES
(1, 'coding'),
(2, 'travel'),
(3, 'cooking');

INSERT INTO "public"."posts_tags" ("post_id", "tag_id") VALUES
(1, 1),
(2, 1),
(2, 3);
