# Repo State

## Current Status

- Purpose: multi-package .NET device-services framework.
- Primary local validation: `./scripts/validate.sh`.
- Full build path: `.github/workflows/build.yml`.
- Full build requirements: Windows runner plus .NET 8 MAUI mobile workloads.

## Stewardship Notes

The local health gate intentionally avoids a false full-build claim on machines that
do not have the mobile workload matrix installed.
