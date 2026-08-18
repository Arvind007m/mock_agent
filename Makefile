# Simple shortcuts. Run `make help` to list them.
ROWS ?= 50
AGENT_MODULE ?= agents.mock_agent

help:
	@echo "make up      - start MySQL in Docker (loads schema + read-only user)"
	@echo "make seed    - insert ROWS=$(ROWS) fake rows per table"
	@echo "make test    - run the agent test harness (AGENT_MODULE=$(AGENT_MODULE))"
	@echo "make all     - up + seed + test (same as ./quickstart.sh)"
	@echo "make down    - stop the DB"
	@echo "make reset   - wipe the DB and start fresh"

up:
	docker compose up -d

seed:
	pip install -q -r requirements.txt
	python3 seed.py --host 127.0.0.1 --port 3306 --user root --password root --db kezzler --rows $(ROWS)

test:
	cd harness && AGENT_MODULE=$(AGENT_MODULE) DB_HOST=127.0.0.1 DB_PORT=3306 DB_NAME=kezzler \
	AGENT_USER=agent_ro AGENT_PW=agent_ro_pw REF_USER=root REF_PW=root python3 run_tests.py

all:
	./quickstart.sh

down:
	docker compose down

reset:
	docker compose down -v
	docker compose up -d

.PHONY: help up seed test all down reset
