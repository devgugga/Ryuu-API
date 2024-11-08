CREATE TABLE reports
(
    id            SERIAL PRIMARY KEY,
    reporter_id   uuid REFERENCES users (id),
    reported_type VARCHAR(20) NOT NULL,
    reported_id   INTEGER     NOT NULL,
    reason        VARCHAR(50) NOT NULL,
    description   TEXT,
    status        VARCHAR(20) NOT NULL     DEFAULT 'pending',
    created_at    TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    resolved_at   TIMESTAMP WITH TIME ZONE,
    resolver_id   uuid REFERENCES users (id),
    CONSTRAINT valid_reported_type CHECK (reported_type IN ('work', 'chapter', 'comment', 'user')),
    CONSTRAINT valid_reason CHECK (reason IN
                                   ('inappropriate', 'copyright', 'quality', 'wrong_translation', 'spam', 'other')),
    CONSTRAINT valid_status CHECK (status IN ('pending', 'investigating', 'resolved', 'rejected'))
);

CREATE TABLE view_logs
(
    id           SERIAL PRIMARY KEY,
    user_id      uuid REFERENCES users (id),
    content_type VARCHAR(20) NOT NULL,
    content_id   INTEGER     NOT NULL,
    viewed_at    TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    ip_address   INET,
    user_agent   TEXT,
    CONSTRAINT valid_content_type CHECK (content_type IN ('work', 'chapter'))
);