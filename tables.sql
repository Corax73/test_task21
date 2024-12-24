CREATE TABLE IF NOT EXISTS "categories" (
    "id" serial PRIMARY KEY,
    "title" character varying NOT NULL
);

CREATE TABLE IF NOT EXISTS "products" (
    "id" serial PRIMARY KEY,
    "title" character varying NOT NULL,
    "category_id" int NOT NULL,
    FOREIGN KEY ("category_id") REFERENCES "categories" ("id")
);

CREATE TABLE IF NOT EXISTS "orders" (
    "id" serial PRIMARY KEY,
    "product_id" int NOT NULL,
    "category_id" int NOT NULL,
    "p_date" timestamp without time zone NOT NULL,
    "amount" integer NOT NULL,
    FOREIGN KEY ("product_id") REFERENCES "products" ("id"),
    FOREIGN KEY ("category_id") REFERENCES "categories" ("id")
);

CREATE TABLE IF NOT EXISTS "statistics" (
    "id" serial PRIMARY KEY,
    "product_id" int NOT NULL,
    "category_id" int NOT NULL,
    FOREIGN KEY ("product_id") REFERENCES "products" ("id"),
    FOREIGN KEY ("category_id") REFERENCES "categories" ("id"),
    "amount" integer NOT NULL,
    "date" TIMESTAMP WITHOUT TIME ZONE
);