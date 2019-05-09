@model AtomicG.Core.Models.TemplateModel
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>netcoreapp2.2</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <ProjectReference Include="..\@(Model.ProjectName).Core\@(Model.ProjectName).Core.csproj" />
    <ProjectReference Include="..\@(Model.ProjectName).Entities\@(Model.ProjectName).Entities.csproj" />
  </ItemGroup>

</Project>
