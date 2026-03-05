# Development

## Local setup

```bash
pnpm install
cp .env.example .env
make up
make dev
```

## Environment variables

See `.env.example` for baseline variables across API/worker/web.

## Scripts and commands

- `make dev`: run local development workflow.
- `make up`: start docker dependencies.
- `make down`: stop docker dependencies.
- `make lint`: lint checks.
- `make test`: test suite.

## Repository conventions

- Keep business logic changes scoped and reviewable.
- Add docs updates with behavior changes.
- Prefer small PRs and clear commit messages.

## Troubleshooting

- If no workspace packages exist yet, scaffold `package.json` scripts before enabling strict CI gates.
- Use `docker compose ps` and `docker compose logs` for dependency debugging.
