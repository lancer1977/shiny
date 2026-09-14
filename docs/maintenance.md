# Maintenance

## Portable Check

```bash
./scripts/validate.sh
```

This checks required files, key project metadata, workflow presence, and build-runner
restore.

## Full Build

The full build is workload-dependent:

```bash
dotnet run --project build/ShinyBuild.csproj
```

Use the existing GitHub Actions build or a Windows environment with .NET 8 MAUI iOS,
Android, MacCatalyst, and Windows workloads installed.

## Local Limitation

On a generic Linux workstation with no MAUI workloads, direct library/test builds can
fail during cross-targeting evaluation before compilation. Treat that as an
environment boundary, not a replacement for the full CI build.
