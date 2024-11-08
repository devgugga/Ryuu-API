CREATE TABLE chapters
(
    id             SERIAL PRIMARY KEY,
    work_id        INTEGER REFERENCES works (id),
    chapter_number DECIMAL      NOT NULL,
    title          VARCHAR(255) NOT NULL,
    translator_id  uuid REFERENCES users (id),
    status         VARCHAR(20)  NOT NULL    DEFAULT 'published',
    version        INTEGER      NOT NULL    DEFAULT 1,
    language       VARCHAR(20)  NOT NULL    DEFAULT 'pt-BR',
    images         JSONB,
    created_at     TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP                DEFAULT NOW() NOT NULL,
    published_at   TIMESTAMP WITH TIME ZONE,
    views          INTEGER                  DEFAULT 0,
    CONSTRAINT valid_status CHECK (status IN ('draft', 'reviewing', 'published', 'deleted'))
);