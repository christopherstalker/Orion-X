# Getting Started

## Prerequisites

- Node.js 20+
- pnpm 9+
- Docker + Docker Compose

## Setup

```bash
pnpm install
cp .env.example .env
```

## Run modes

### Local dependencies only

```bash
make up
```

### Development mode

```bash
make dev
```

### Stop dependencies

```bash
make down
```

## Environment

All baseline variables are documented in `.env.example`.

## First check

```bash
make system-check
```
