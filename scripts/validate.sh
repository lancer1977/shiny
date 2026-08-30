#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

required_files=(
  "README.md"
  "readme.md"
  "LICENSE.md"
  "Shiny.sln"
  "Build.slnf"
  "version.json"
  "build.sh"
  "build.ps1"
  "build/ShinyBuild.csproj"
  "src/Directory.build.props"
  "src/Directory.build.targets"
  "src/Shiny.Core/Shiny.Core.csproj"
  "tests/Shiny.Tests/Shiny.Tests.csproj"
  ".github/workflows/build.yml"
  ".github/workflows/validate.yml"
  "docs/index.md"
  "docs/maintenance.md"
  "repo-state.md"
)

for path in "${required_files[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "Missing required file: $path" >&2
    exit 1
  fi
done

python3 - <<'PY'
from pathlib import Path
import json
import sys
import xml.etree.ElementTree as ET

required_dirs = [
    Path("src/Shiny.Core"),
    Path("src/Shiny.BluetoothLE"),
    Path("src/Shiny.Locations"),
    Path("src/Shiny.Notifications"),
    Path("src/Shiny.Push"),
    Path("tests/Shiny.Tests"),
    Path("samples"),
    Path("build"),
]
missing = [str(path) for path in required_dirs if not path.is_dir()]
if missing:
    print("Missing required directories: " + ", ".join(missing), file=sys.stderr)
    sys.exit(1)

json.loads(Path("version.json").read_text(encoding="utf-8-sig"))

xml_files = [
    Path("build/ShinyBuild.csproj"),
    Path("src/Directory.build.props"),
    Path("src/Directory.build.targets"),
    Path("src/Shiny.Core/Shiny.Core.csproj"),
    Path("tests/Shiny.Tests/Shiny.Tests.csproj"),
]
for path in xml_files:
    try:
        ET.parse(path)
    except ET.ParseError as exc:
        print(f"Invalid XML in {path}: {exc}", file=sys.stderr)
        sys.exit(1)

build_workflow = Path(".github/workflows/build.yml").read_text(encoding="utf-8-sig")
for phrase in ["dotnet workload install", "dotnet run --project build/ShinyBuild.csproj"]:
    if phrase not in build_workflow:
        print(f"Build workflow is missing expected phrase: {phrase}", file=sys.stderr)
        sys.exit(1)

solution_filter = Path("Build.slnf").read_text(encoding="utf-8")
for project in ["src\\\\Shiny.Core\\\\Shiny.Core.csproj", "src\\\\Shiny.Push\\\\Shiny.Push.csproj"]:
    if project not in solution_filter:
        print(f"Build.slnf is missing expected project: {project}", file=sys.stderr)
        sys.exit(1)

readme = Path("README.md").read_text(encoding="utf-8")
for phrase in ["Repository Layout", "Validation", "Build Notes"]:
    if phrase not in readme:
        print(f"README.md is missing expected section: {phrase}", file=sys.stderr)
        sys.exit(1)
PY

if [[ "${SHINY_SKIP_DOTNET_RESTORE:-0}" != "1" ]]; then
  dotnet restore build/ShinyBuild.csproj --verbosity minimal
else
  echo "Skipping dotnet restore because SHINY_SKIP_DOTNET_RESTORE=1"
fi

echo "shiny validation passed."
