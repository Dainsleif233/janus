-- CreateTable
CREATE TABLE "yggc_authorization_codes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" JSONB NOT NULL,
    "uid" TEXT,
    "consumed" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "yggc_device_codes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" JSONB NOT NULL,
    "userCode" TEXT,
    "uid" TEXT,
    "consumed" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "yggc_refresh_tokens" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" JSONB NOT NULL,
    "uid" TEXT,
    "consumed" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "yggc_grants" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" JSONB NOT NULL,
    "uid" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "yggc_interactions" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" JSONB NOT NULL,
    "uid" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "yggc_sessions" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" JSONB NOT NULL,
    "uid" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "yggc_authorization_codes_id_key" ON "yggc_authorization_codes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_authorization_codes_uid_key" ON "yggc_authorization_codes"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_device_codes_id_key" ON "yggc_device_codes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_device_codes_uid_key" ON "yggc_device_codes"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_refresh_tokens_id_key" ON "yggc_refresh_tokens"("id");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_refresh_tokens_uid_key" ON "yggc_refresh_tokens"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_grants_id_key" ON "yggc_grants"("id");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_grants_uid_key" ON "yggc_grants"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_interactions_id_key" ON "yggc_interactions"("id");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_interactions_uid_key" ON "yggc_interactions"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_sessions_id_key" ON "yggc_sessions"("id");

-- CreateIndex
CREATE UNIQUE INDEX "yggc_sessions_uid_key" ON "yggc_sessions"("uid");
