CREATE TABLE users
(
    id            uuid                         DEFAULT gen_random_uuid() PRIMARY KEY,
    username      VARCHAR(50) UNIQUE  NOT NULL,
    email         VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255)        NOT NULL,
    role          VARCHAR(20)         NOT NULL DEFAULT 'reader',
    status        VARCHAR(20)         NOT NULL DEFAULT 'active',
    created_at    TIMESTAMP WITH TIME ZONE     DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP                    DEFAULT NOW() NOT NULL,
    deleted_at    TIMESTAMP WITH TIME ZONE,
    CONSTRAINT valid_role CHECK (role IN ('reader', 'writer', 'admin')),
    CONSTRAINT valid_status CHECK (status IN ('active', 'inactive', 'banned'))
);