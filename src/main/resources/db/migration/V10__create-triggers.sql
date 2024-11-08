-- Users
CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE
    ON users
    FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Works
CREATE TRIGGER update_works_updated_at
    BEFORE UPDATE
    ON works
    FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Chapters
CREATE TRIGGER update_chapters_updated_at
    BEFORE UPDATE
    ON chapters
    FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Teams
CREATE TRIGGER update_teams_updated_at
    BEFORE UPDATE
    ON teams
    FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Comments
CREATE TRIGGER update_comments_updated_at
    BEFORE UPDATE
    ON comments
    FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();