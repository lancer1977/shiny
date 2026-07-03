# Memory

Long-lived maintenance notes belong here.

Current validation note: `dotnet restore build/ShinyBuild.csproj` is the portable
.NET check on this machine. Direct `dotnet build src/Shiny.Core/Shiny.Core.csproj`
currently fails under the installed SDK 10 cross-targeting evaluation without the
repo's intended .NET 8 workload environment.
