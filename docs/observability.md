# Observability

Orion-X should expose metrics, tracing, and structured logs for each workflow run.

## Metrics (recommended)

- `orion_run_started_total`
- `orion_run_completed_total`
- `orion_run_failed_total`
- `orion_task_duration_seconds` (histogram)
- `orion_queue_depth`
- `orion_worker_active`

## Tracing

Use OpenTelemetry end-to-end:

- Create trace at API ingress.
- Propagate context through queue messages.
- Create worker spans per task execution.
- Attach run/task IDs as span attributes.

## Logging

Use structured JSON logs with fields:

- `timestamp`
- `level`
- `service` (`api|worker|web`)
- `runId`
- `taskId`
- `eventType`
- `message`

## Alerting ideas

- High run failure ratio over 5m.
- Queue depth sustained above threshold.
- Worker heartbeat timeout.

## Operational dashboards

Recommended dashboard sections:

- Run throughput and failure rate
- P95/P99 task duration
- Queue backlog
- Worker saturation
