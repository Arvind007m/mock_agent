-- The AI agent should NEVER connect as root.
-- It connects as this read-only user. It can SELECT, nothing else.
-- This is your main safety net: even a bad query can't delete or change data.
CREATE USER IF NOT EXISTS 'agent_ro'@'%' IDENTIFIED BY 'agent_ro_pw';
GRANT SELECT ON kezzler.* TO 'agent_ro'@'%';
FLUSH PRIVILEGES;
