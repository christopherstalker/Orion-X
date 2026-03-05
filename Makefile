.PHONY: dev up down lint test system-check

dev:
	@if pnpm run --if-present dev; then \
		echo "dev command finished"; \
	else \
		echo "No dev script configured yet."; \
	fi

up:
	@if [ -f docker-compose.yml ] || [ -f compose.yml ]; then \
		docker compose up -d; \
	else \
		echo "No docker compose file found."; \
	fi

down:
	@if [ -f docker-compose.yml ] || [ -f compose.yml ]; then \
		docker compose down; \
	else \
		echo "No docker compose file found."; \
	fi

lint:
	pnpm run --if-present lint

test:
	pnpm run --if-present test

system-check:
	pnpm run --if-present lint
	pnpm run --if-present test
	pnpm run --if-present build
