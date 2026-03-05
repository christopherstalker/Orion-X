# Workflows

Workflows are modeled as DAGs. A task runs only when all dependencies listed in `needs` are complete.

## Minimal workflow shape

```json
{
  "id": "wf_demo",
  "version": 1,
  "tasks": [
    { "id": "extract", "type": "http" },
    { "id": "transform", "type": "container", "needs": ["extract"] },
    { "id": "load", "type": "sql", "needs": ["transform"] }
  ]
}
```

## Validation expectations

- Task IDs are unique.
- Graph is acyclic.
- Every dependency points to an existing task.
- Executor config matches task type requirements.

## Example patterns

- **Linear**: `extract -> transform -> load`
- **Fan-out/fan-in**: `extract -> [a, b, c] -> merge`
