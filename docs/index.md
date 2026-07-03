# Shiny Maintenance Index

This repository contains the Shiny .NET libraries, samples, build runner, and
platform test app.

## Main Areas

- `src/` contains package source.
- `tests/Shiny.Tests/` contains the MAUI-hosted platform test app.
- `samples/` contains runnable app samples.
- `build/` contains the Cake Frosting build orchestration.
- `.github/workflows/` contains the full build and stewardship validation workflows.

## Validation

Use `./scripts/validate.sh` for portable local validation. Use
`.github/workflows/build.yml` or an equivalent Windows machine with MAUI workloads
for the full package build.
