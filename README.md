# Shiny

Shiny is a cross-platform .NET framework for device services and background
processes. It provides libraries for jobs, notifications, push, GPS/geofencing,
Bluetooth LE, beacons, HTTP transfers, logging, repositories, and hosting helpers.

The upstream project overview remains in `readme.md`.

## Repository Layout

- `src/` contains the Shiny libraries and shared build props/targets.
- `tests/Shiny.Tests/` contains the MAUI-hosted test app and platform tests.
- `samples/` contains MAUI, Blazor, push, and API samples.
- `build/` contains the Cake Frosting build runner.
- `.github/workflows/build.yml` contains the full Windows build workflow.

## Validation

Run the local stewardship validation before handing off changes:

```bash
./scripts/validate.sh
```

The local validator checks repository shape, key XML metadata, docs, workflow files,
and restores the build runner. Full library and test builds require the .NET 8
mobile workload matrix used by the existing GitHub Actions build.

## Build Notes

The checked-in workflow installs MAUI iOS, Android, MacCatalyst, and Windows
workloads on `windows-latest`, then runs:

```bash
dotnet run --project build/ShinyBuild.csproj
```

Generic Linux workstations without those workloads should use `scripts/validate.sh`
as the portable health check.
