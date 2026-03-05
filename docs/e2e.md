# End-to-End Testing

This repository currently contains e2e workflow scaffolding and CI hooks, but does not yet include a concrete e2e test suite implementation.

## Current state

- No dedicated e2e GitHub Actions workflow is committed yet.
- Add one once runtime services and fixtures are available.

## Recommended future setup

1. Start dependencies with Docker Compose.
2. Boot API + worker + web.
3. Seed test org/workflow fixtures.
4. Execute smoke flow (`create org -> create workflow -> trigger run -> assert completion`).

## Suggested command target

When tests are implemented, wire one of:

- `pnpm e2e`
- `pnpm --filter @orion-x/e2e test`
- `make e2e`
