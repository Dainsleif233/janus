-- CreateTable
CREATE TABLE "code_id_to_uuid" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "code_id" TEXT NOT NULL,
    "uuid" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "code_id_to_uuid_code_id_fkey" FOREIGN KEY ("code_id") REFERENCES "oauth_auth_codes" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "oauth_access_tokens" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "user_id" INTEGER,
    "client_id" INTEGER NOT NULL,
    "name" TEXT,
    "scopes" TEXT,
    "revoked" BOOLEAN NOT NULL,
    "created_at" DATETIME,
    "updated_at" DATETIME,
    "expires_at" DATETIME
);

-- CreateTable
CREATE TABLE "oauth_auth_codes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "scopes" TEXT,
    "revoked" BOOLEAN NOT NULL,
    "expires_at" DATETIME
);

-- CreateTable
CREATE TABLE "oauth_refresh_tokens" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "access_token_id" TEXT NOT NULL,
    "revoked" BOOLEAN NOT NULL,
    "expires_at" DATETIME
);

-- CreateTable
CREATE TABLE "oauth_clients" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER,
    "name" TEXT NOT NULL,
    "secret" TEXT,
    "provider" TEXT,
    "redirect" TEXT NOT NULL,
    "personal_access_client" BOOLEAN NOT NULL,
    "password_client" BOOLEAN NOT NULL,
    "revoked" BOOLEAN NOT NULL,
    "created_at" DATETIME,
    "updated_at" DATETIME
);

-- CreateTable
CREATE TABLE "options" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "option_name" TEXT NOT NULL,
    "option_value" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "players" (
    "pid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uid" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "tid_cape" INTEGER NOT NULL DEFAULT 0,
    "last_modified" DATETIME NOT NULL,
    "tid_skin" INTEGER NOT NULL DEFAULT -1
);

-- CreateTable
CREATE TABLE "users" (
    "uid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "nickname" TEXT NOT NULL DEFAULT '',
    "locale" TEXT,
    "score" INTEGER NOT NULL,
    "avatar" INTEGER NOT NULL DEFAULT 0,
    "password" TEXT NOT NULL,
    "ip" TEXT NOT NULL,
    "is_dark_mode" BOOLEAN NOT NULL DEFAULT false,
    "permission" INTEGER NOT NULL DEFAULT 0,
    "last_sign_at" DATETIME NOT NULL,
    "register_at" DATETIME NOT NULL,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "verification_token" TEXT NOT NULL DEFAULT '',
    "remember_token" TEXT
);

-- CreateTable
CREATE TABLE "uuid" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pid" INTEGER,
    "name" TEXT NOT NULL,
    "uuid" TEXT NOT NULL,
    "created_at" DATETIME,
    "updated_at" DATETIME,
    CONSTRAINT "uuid_pid_fkey" FOREIGN KEY ("pid") REFERENCES "players" ("pid") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "yggc_authorization_codes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" TEXT NOT NULL,
    "uid" TEXT,
    "consumed" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "yggc_device_codes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" TEXT NOT NULL,
    "userCode" TEXT,
    "uid" TEXT,
    "consumed" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "yggc_refresh_tokens" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" TEXT NOT NULL,
    "uid" TEXT,
    "consumed" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "yggc_grants" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" TEXT NOT NULL,
    "uid" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "yggc_interactions" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" TEXT NOT NULL,
    "uid" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "yggc_sessions" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "payload" TEXT NOT NULL,
    "uid" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "code_id_to_uuid_code_id_key" ON "code_id_to_uuid"("code_id");

-- CreateIndex
CREATE INDEX "oauth_access_tokens_user_id_idx" ON "oauth_access_tokens"("user_id");

-- CreateIndex
CREATE INDEX "oauth_auth_codes_user_id_idx" ON "oauth_auth_codes"("user_id");

-- CreateIndex
CREATE INDEX "oauth_refresh_tokens_access_token_id_idx" ON "oauth_refresh_tokens"("access_token_id");

-- CreateIndex
CREATE INDEX "oauth_clients_user_id_idx" ON "oauth_clients"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "uuid_pid_key" ON "uuid"("pid");

-- CreateIndex
CREATE UNIQUE INDEX "uuid_name_key" ON "uuid"("name");

-- CreateIndex
CREATE UNIQUE INDEX "uuid_uuid_key" ON "uuid"("uuid");

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
