-- CreateTable
CREATE TABLE "public"."account" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" VARCHAR,
    "name" VARCHAR,
    "roles" VARCHAR,
    "phone" VARCHAR,
    "address" VARCHAR,
    "signup_type" VARCHAR NOT NULL,
    "refresh_token" VARCHAR,
    "last_contacted_at" TIMESTAMP(3),
    "nick_name" VARCHAR,
    "status" VARCHAR,
    "gender" VARCHAR,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."account_social" (
    "id" SERIAL NOT NULL,
    "account_id" INTEGER NOT NULL,
    "nick_name" VARCHAR,
    "social_name" VARCHAR NOT NULL,
    "access_token" VARCHAR,
    "access_token_expired_in" INTEGER,
    "refresh_token" VARCHAR,
    "refresh_token_expired_in" INTEGER,
    "token_type" VARCHAR,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "account_social_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "email_unique" ON "public"."account"("email");

-- CreateIndex
CREATE UNIQUE INDEX "account_id_unique" ON "public"."account_social"("account_id");
