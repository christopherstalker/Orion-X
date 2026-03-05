# Operations

## Health and readiness

Recommended endpoint conventions for runtime services:

- `GET /healthz` for liveness
- `GET /readyz` for readiness
- `GET /metrics` for Prometheus metrics

## Metrics to prioritize

- Workflow runs started/completed/failed
- Task execution latency (P50/P95/P99)
- Queue depth and dequeue rate
- Worker concurrency and saturation

## Scaling workers

- Start by increasing worker replicas and keeping concurrency modest.
- Validate queue depth reduction and task latency before raising concurrency.
- Keep task handlers idempotent to tolerate retries.

## Troubleshooting checklist

- Verify queue connectivity and credentials.
- Confirm event store write/read latency.
- Check worker logs for repeated retries or timeouts.
- Compare projection lag against event store write timestamps.
