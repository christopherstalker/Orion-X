# Architecture

Orion-X follows an event-oriented orchestration architecture intended to provide auditability, replayability, and scalable execution.

## Core components

- **API service**: accepts workflow definitions and run requests.
- **Event store**: append-only source of truth for state transitions.
- **Queue**: buffers executable task jobs.
- **Worker pool**: executes tasks and emits completion/failure events.
- **Projection processor**: builds read models for low-latency queries.
- **Web/clients**: consume read models via API.

## Event flow

1. Client requests `RunScheduled`.
2. API persists event to event store.
3. Scheduler/projection determines runnable DAG nodes.
4. Runnable nodes are enqueued.
5. Worker executes task and emits `TaskSucceeded`/`TaskFailed`.
6. Projection updates run status and task timelines.

## Why event sourcing

- Full audit log of all workflow lifecycle events.
- Deterministic replay to rebuild projections.
- Easier incident analysis and observability correlation.

## Projection model

Typical projection tables/models:

- `runs` (summary status, started/finished timestamps)
- `run_tasks` (per-task status, attempts, duration)
- `run_events` (flattened timeline for UI)

## Queue and workers

Workers should support:

- Visibility timeout + retries
- Backoff policy
- Idempotency key handling
- Heartbeat for long-running tasks

## Consistency model

- Event store is strongly consistent for writes.
- Read models are eventually consistent.
- APIs should expose both current projection state and (optionally) raw event inspection.
