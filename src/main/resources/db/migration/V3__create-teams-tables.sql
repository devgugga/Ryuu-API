CREATE TABLE teams
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255)                           NOT NULL,
    description TEXT,
    leader_id   uuid REFERENCES users (id),
    avatar_url  VARCHAR(255),
    created_at  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP                DEFAULT NOW() NOT NULL,
    deleted_at  TIMESTAMP WITH TIME ZONE
);

CREATE TABLE team_members
(
    team_id   INTEGER REFERENCES teams (id),
    user_id   uuid REFERENCES users (id),
    role      VARCHAR(20) NOT NULL,
    joined_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (team_id, user_id),
    CONSTRAINT valid_role CHECK (role IN ('leader', 'translator', 'editor', 'proofreader'))
);