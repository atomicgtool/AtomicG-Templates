@model AtomicG.Core.Models.TemplateModel
# @Model.ProjectName

This project was generated with [AtomicG Web Tool](https://www.atomicg.dev/)

The latest major release is [.NET Core 2.2](release-notes/2.2). The latest patch updates are listed in [.NET Core release notes](release-notes/README.md).

## Prerequisites

* [.NET Core 2.2 SDK](release-notes/2.2/README.md)

@if (Model.IntegrateWithFrontend != null && Model.IntegrateWithFrontend == "Angular")
{
<text>* [Angular CLI](https://github.com/angular/angular-cli) version 7.3.5 or high
</text>
}

## Build and Run

* Using [Visual Studio 2019](https://visualstudio.microsoft.com/vs/) on Windows

 Right click on @(Model.ProjectName).Web project and "Set as StartUp Project" and press F5

* Using [Visual Studio Code](https://code.visualstudio.com/Download) or CMD on Windows, Linux and MacOS
 
 ```
 dotnet run --project @(Model.ProjectName).Web
 ```

## Learn about .NET Core

* [Learn about .NET Core](https://docs.microsoft.com/dotnet/core)
* [.NET Core Roadmap](https://github.com/dotnet/core/blob/master/roadmap.md)
* [Learn about the .NET platform](https://docs.microsoft.com/dotnet/standard/)
* [.NET Core release notes](https://github.com/dotnet/core/blob/master/release-notes/README.md)
* [.NET Core Announcements](https://github.com/dotnet/announcements)
* [.NET Core blog](https://blogs.msdn.microsoft.com/dotnet/tag/net-core/)

## Getting help

* [File a .NET Core issue](https://github.com/dotnet/core/issues)
* [File an ASP.NET Core issue](https://github.com/aspnet/home/issues)
* [File an issue for other components](Documentation/core-repos.md)
* [Ask on Stack Overflow](https://stackoverflow.com/questions/tagged/.net-core)
* [Contact Microsoft Support](https://support.microsoft.com/contactus/)
* [VS Developer Community Portal](https://developercommunity.visualstudio.com/) for "full" .NET Framework feedback (or via [Report a Problem](https://aka.ms/vs-rap) tool)