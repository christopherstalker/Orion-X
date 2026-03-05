# Architecture

Orion-X uses an event-oriented orchestration model designed for traceability and deterministic state reconstruction.

## Core components

- **API**: accepts workflow definitions and run commands.
- **Event Store**: append-only source of truth for state transitions.
- **Queue**: buffers runnable task jobs.
- **Workers**: execute jobs and emit completion/failure events.
- **Orchestrator**: evaluates DAG readiness and dispatches eligible tasks.
- **Projections**: maintain read models optimized for query latency.

## Lifecycle

1. A run is scheduled through the API.
2. API writes a `RunScheduled` event.
3. Orchestrator reads state and enqueues runnable tasks.
4. Workers process tasks and write result events.
5. Projections update run/task read models.

## Consistency model

- Event writes are authoritative.
- Read models are eventually consistent.
- Replay from the event store can rebuild projections after faults.

## Why this model

- Durable audit trail for every run transition.
- Clear separation of write path (events) and read path (projections).
- Worker scaling can increase throughput without changing API contracts.
