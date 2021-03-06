﻿@model AtomicG.Core.Models.TemplateModel
<Project Sdk="Microsoft.NET.Sdk.Web">

  <PropertyGroup>
    <TargetFramework>netcoreapp2.2</TargetFramework>
@if (Model.IntegrateWithFrontend != null && (Model.IntegrateWithFrontend == "Angular" || Model.IntegrateWithFrontend == "VueJs"))
{
	if (Model.IntegrateWithFrontend == "Angular")
	{
    <TypeScriptCompileBlocked>true</TypeScriptCompileBlocked>
    <TypeScriptToolsVersion>Latest</TypeScriptToolsVersion>
    <IsPackable>false</IsPackable>
	<!-- Set this to true if you enable server-side prerendering -->
    <BuildServerSideRenderer>false</BuildServerSideRenderer>
	}
    <SpaRoot>ClientApp\</SpaRoot>
    <DefaultItemExcludes>$(DefaultItemExcludes);$(SpaRoot)node_modules\**</DefaultItemExcludes>    
}
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="AutoMapper.Extensions.Microsoft.DependencyInjection" Version="6.0.0" />
    <PackageReference Include="FluentValidation.AspNetCore" Version="8.1.3" />
    <PackageReference Include="Microsoft.AspNetCore.App" />
    <PackageReference Include="Microsoft.AspNetCore.Razor.Design" Version="2.2.0" PrivateAssets="All" />
	@if (Model.IntegrateWithFrontend != null && Model.IntegrateWithFrontend == "VueJs")
	{
    <PackageReference Include="Microsoft.AspNetCore.SpaServices.Extensions" Version="2.2.0" />
    <PackageReference Include="VueCliMiddleware" Version="2.2.1" />
	}
  </ItemGroup>

  <ItemGroup>
    <ProjectReference Include="..\@(Model.ProjectName).Core\@(Model.ProjectName).Core.csproj" />
    <ProjectReference Include="..\@(Model.ProjectName).Entities\@(Model.ProjectName).Entities.csproj" />
    <ProjectReference Include="..\@(Model.ProjectName)\@(Model.ProjectName).csproj" />
  </ItemGroup>

@if (Model.IntegrateWithFrontend != null && (Model.IntegrateWithFrontend == "Angular" || Model.IntegrateWithFrontend == "VueJs"))
{
  <Target Name="DebugEnsureNodeEnv" BeforeTargets="Build" Condition=" '$(Configuration)' == 'Debug' And !Exists('$(SpaRoot)node_modules') ">
    <!-- Ensure Node.js is installed -->
    <Exec Command="node --version" ContinueOnError="true">
      <Output TaskParameter="ExitCode" PropertyName="ErrorCode" />
    </Exec>
    <Error Condition="'$(ErrorCode)' != '0'" Text="Node.js is required to build and run this project. To continue, please install Node.js from https://nodejs.org/, and then restart your command prompt or IDE." />
    <Message Importance="high" Text="Restoring dependencies using 'npm'. This may take several minutes..." />
    <Exec WorkingDirectory="$(SpaRoot)" Command="npm install" />
  </Target>

  <Target Name="PublishRunWebpack" AfterTargets="ComputeFilesToPublish">
    <!-- As part of publishing, ensure the JS resources are freshly built in production mode -->
    <Exec WorkingDirectory="$(SpaRoot)" Command="npm install" />
    <Exec WorkingDirectory="$(SpaRoot)" Command="npm run build -- --prod" />
	@if (Model.IntegrateWithFrontend == "Angular")
	{
    <Exec WorkingDirectory="$(SpaRoot)" Command="npm run build:ssr -- --prod" Condition=" '$(BuildServerSideRenderer)' == 'true' " />
	}
    <!-- Include the newly-built files in the publish output -->
    <ItemGroup>
      <DistFiles Include="$(SpaRoot)dist\**; $(SpaRoot)dist-server\**" />
	  @if (Model.IntegrateWithFrontend == "Angular")
	  {
      <DistFiles Include="$(SpaRoot)node_modules\**" Condition="'$(BuildServerSideRenderer)' == 'true'" />
	  }
      <ResolvedFileToPublish Include="@@(DistFiles->'%(FullPath)')" Exclude="@@(ResolvedFileToPublish)">
        <RelativePath>%(DistFiles.Identity)</RelativePath>
        <CopyToPublishDirectory>PreserveNewest</CopyToPublishDirectory>
      </ResolvedFileToPublish>
    </ItemGroup>
  </Target>
}
</Project>
