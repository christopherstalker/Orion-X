# Contributing to Orion-X

Thanks for contributing.

## Local setup

```bash
pnpm install
cp .env.example .env
make up
make dev
```

## Branch naming

- `feat/<short-description>`
- `fix/<short-description>`
- `docs/<short-description>`
- `chore/<short-description>`

## Commit style

Use Conventional Commits when possible:

- `feat: add workflow retries`
- `fix: correct queue visibility timeout`
- `docs: improve getting-started guide`

## Pull request checklist

- [ ] Scope is focused and reviewable.
- [ ] Docs updated for any behavior/interface change.
- [ ] `make lint` and `make test` passed locally.
- [ ] Linked issue(s) when applicable.
