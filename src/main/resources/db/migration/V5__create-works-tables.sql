CREATE TABLE works
(
    id                SERIAL PRIMARY KEY,
    title             VARCHAR(255) NOT NULL,
    alternative_title JSONB,
    description       TEXT,
    type              VARCHAR(255) NOT NULL,
    status            VARCHAR(255) NOT NULL,
    cover_url         VARCHAR(255),
    author            VARCHAR(255),
    artist            VARCHAR(255),
    age_rating        VARCHAR(20),
    language          VARCHAR(20)  NOT NULL    DEFAULT 'pt-BR',
    genre             TEXT[]       NOT NULL,
    tags              TEXT[]       NOT NULL,
    created_at        TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP                DEFAULT NOW() NOT NULL,
    views             INTEGER                  DEFAULT 0,
    CONSTRAINT valid_type CHECK (type IN ('manga', 'manhwa', 'manhua', 'novel')),
    CONSTRAINT valid_status CHECK (status IN ('ongoing', 'completed', 'hiatus', 'cancelled')),
    CONSTRAINT valid_age_rating CHECK (age_rating IN ('all', '10+', '12+', '14+', '16+', '18+'))
);

CREATE TABLE work_tags
(
    work_id INTEGER REFERENCES works (id),
    tag_id  INTEGER REFERENCES tags (id),
    PRIMARY KEY (work_id, tag_id)
);

CREATE TABLE work_claims
(
    id         SERIAL PRIMARY KEY,
    work_id    INTEGER REFERENCES works (id),
    team_id    INTEGER REFERENCES teams (id),
    status     VARCHAR(20) NOT NULL     DEFAULT 'active',
    claimed_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT valid_status CHECK (status IN ('active', 'expired', 'dropped', 'completed'))
);