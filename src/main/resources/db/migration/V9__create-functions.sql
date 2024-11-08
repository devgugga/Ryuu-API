CREATE OR REPLACE FUNCTION update_updated_at_column()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION increment_views(
    content_type VARCHAR,
    content_id INTEGER,
    user_ip INET,
    user_agent TEXT,
    user_id uuid DEFAULT NULL
) RETURNS VOID AS
$$
DECLARE
    last_view TIMESTAMP;
BEGIN
    -- Verifica última visualização deste IP/usuário
    SELECT viewed_at
    INTO last_view
    FROM view_logs
    WHERE (ip_address = user_ip OR (user_id IS NOT NULL AND view_logs.user_id = increment_views.user_id))
      AND content_type = increment_views.content_type
      AND content_id = increment_views.content_id
    ORDER BY viewed_at DESC
    LIMIT 1;

    -- Se não houver visualização nas últimas 6 horas
    IF last_view IS NULL OR last_view < NOW() - INTERVAL '6 hours' THEN
        -- Incrementa contador
        IF content_type = 'work' THEN
            UPDATE works SET views = views + 1 WHERE id = content_id;
        ELSIF content_type = 'chapter' THEN
            UPDATE chapters SET views = views + 1 WHERE id = content_id;
        END IF;

        -- Registra visualização
        INSERT INTO view_logs (user_id, content_type, content_id, ip_address, user_agent)
        VALUES (user_id, content_type, content_id, user_ip, user_agent);
    END IF;
END;
$$ LANGUAGE plpgsql;