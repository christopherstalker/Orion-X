# Contributing to Orion-X

Thanks for contributing! This guide helps keep changes consistent and easy to review.

## Development setup

```bash
pnpm install
cp .env.example .env
make up
make dev
```

## Branch naming

Use one of:

- `feat/<short-description>`
- `fix/<short-description>`
- `docs/<short-description>`
- `chore/<short-description>`

## Commit style

Prefer Conventional Commits:

- `feat: add workflow retry policy docs`
- `fix: correct queue config parsing`
- `docs: improve readme quickstart`

## Pull request rules

- Keep PRs focused and reasonably small.
- Include context, motivation, and testing notes.
- Link related issues when applicable.
- Update docs when behavior or APIs change.

## Local quality checks

```bash
make lint
make test
```

If no runtime packages are present yet, keep documentation and CI scaffolding in sync with the repository state.
