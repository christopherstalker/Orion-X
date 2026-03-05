.PHONY: dev up down test lint

dev:
	@if [ -f package.json ]; then \
		pnpm dev; \
	else \
		echo "No package.json found. Add workspace packages before running dev."; \
	fi

up:
	@if [ -f docker-compose.yml ] || [ -f compose.yml ]; then \
		docker compose up -d; \
	else \
		echo "No docker compose file found (docker-compose.yml or compose.yml)."; \
	fi

down:
	@if [ -f docker-compose.yml ] || [ -f compose.yml ]; then \
		docker compose down; \
	else \
		echo "No docker compose file found (docker-compose.yml or compose.yml)."; \
	fi

test:
	@if [ -f package.json ]; then \
		pnpm test; \
	else \
		echo "No package.json found. Add tests when runtime packages are added."; \
	fi

lint:
	@if [ -f package.json ]; then \
		pnpm lint; \
	else \
		echo "No package.json found. Add lint scripts when runtime packages are added."; \
	fi
