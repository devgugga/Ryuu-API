CREATE TABLE reading_progress
(
    user_id         uuid REFERENCES users (id),
    work_id         INTEGER REFERENCES works (id),
    last_chapter_id INTEGER REFERENCES chapters (id),
    updated_at      TIMESTAMP DEFAULT NOW() NOT NULL,
    PRIMARY KEY (user_id, work_id)
);

CREATE TABLE favorites
(
    user_id    uuid REFERENCES users (id),
    work_id    INTEGER REFERENCES works (id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, work_id)
);

CREATE TABLE comments
(
    id         SERIAL PRIMARY KEY,
    user_id    uuid REFERENCES users (id),
    work_id    INTEGER REFERENCES works (id),
    chapter_id INTEGER REFERENCES chapters (id),
    content    TEXT                                   NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP                DEFAULT NOW() NOT NULL
);