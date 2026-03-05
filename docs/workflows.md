# Workflows

This document defines the workflow model for Orion-X.

## DAG model

- A workflow is a directed acyclic graph of tasks.
- Each task can declare `needs` dependencies.
- A task becomes runnable when all required upstream tasks succeed.

## Minimal schema (conceptual)

```yaml
id: wf_name
version: 1
tasks:
  - id: task_a
    type: http
  - id: task_b
    needs: [task_a]
    type: container
```

## Versioning plan

- **Immutable versions**: once published, version contents do not change.
- **New revision => new integer version**.
- Runs always reference a pinned workflow version.
- Store migration metadata for backward compatibility.

## Validation rules

- Unique task IDs within workflow.
- No cycles.
- `needs` references must exist.
- Executor config must satisfy task `type` requirements.

## Example workflows

### Linear ETL

`extract -> transform -> load`

### Fan-out / fan-in

`extract -> [transform_a, transform_b] -> merge`

### Optional future enhancements (roadmap)

- Conditional branches
- Loop/retry policy in DSL
- Workflow templates with parameters
