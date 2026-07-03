# Agent Notes

## Purpose

Shiny is a multi-package .NET device-services framework. Keep library changes
focused on the relevant module under `src/` and add matching tests in
`tests/Shiny.Tests/` when the platform test app can cover the behavior.

## Validation

Use:

```bash
./scripts/validate.sh
```

The script performs deterministic repository checks and restores the build runner.
Full compile/test coverage depends on MAUI workloads and platform targets installed
by `.github/workflows/build.yml`.

## Change Boundaries

- Do not retarget the repository or update the build SDK unless the task is
  explicitly a build migration.
- Treat mobile platform builds as workload-dependent.
- Do not commit build output, packages, signing material, or local secrets.
