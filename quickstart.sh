#!/usr/bin/env bash
# One command to stand up the test DB, load fake data, and run the full agent test suite.
# Usage:
#   ./quickstart.sh              # test the built-in mock agent
#   AGENT_MODULE=agents.my_real_agent ./quickstart.sh   # test YOUR agent
set -e

ROWS="${ROWS:-50}"                      # fake rows per table
AGENT_MODULE="${AGENT_MODULE:-agents.mock_agent}"

echo "==> 1/4  Installing Python deps"
pip install -q -r requirements.txt

echo "==> 2/4  Starting MySQL in Docker (schema + read-only user auto-load)"
docker compose up -d
echo "    waiting for MySQL to accept connections..."
until docker exec kezzler-test-db mysqladmin ping -uroot -proot --silent >/dev/null 2>&1; do
  sleep 2
done
sleep 3   # let init scripts finish

echo "==> 3/4  Seeding $ROWS fake rows per table"
python3 seed.py --host 127.0.0.1 --port 3306 --user root --password root --db kezzler --rows "$ROWS"

echo "==> 4/4  Running the test harness against: $AGENT_MODULE"
cd harness
AGENT_MODULE="$AGENT_MODULE" \
DB_HOST=127.0.0.1 DB_PORT=3306 DB_NAME=kezzler \
AGENT_USER=agent_ro AGENT_PW=agent_ro_pw \
REF_USER=root REF_PW=root \
python3 run_tests.py

echo
echo "Done. To stop the DB:            docker compose down"
echo "To wipe and start clean:        docker compose down -v"
