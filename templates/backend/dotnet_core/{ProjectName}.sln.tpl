@model AtomicG.Core.Models.TemplateModel
Microsoft Visual Studio Solution File, Format Version 12.00
# Visual Studio Version 16
VisualStudioVersion = 16.0.28714.193
MinimumVisualStudioVersion = 10.0.40219.1
Project("{9A19103F-16F7-4668-BE54-9A1E7A4F7556}") = "@(Model.ProjectName).Entities", "@(Model.ProjectName).Entities\@(Model.ProjectName).Entities.csproj", "{99746ED3-10DD-4078-A808-8A3BE423B200}"
EndProject
Project("{9A19103F-16F7-4668-BE54-9A1E7A4F7556}") = "@(Model.ProjectName).Web", "@(Model.ProjectName).Web\@(Model.ProjectName).Web.csproj", "{FEE2691A-5EE6-4C53-96DE-31815396A05E}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "@(Model.ProjectName)", "@(Model.ProjectName)\@(Model.ProjectName).csproj", "{65F97529-61BF-483D-9B13-A94B27F20F0D}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "@(Model.ProjectName).Core", "@(Model.ProjectName).Core\@(Model.ProjectName).Core.csproj", "{B2CF9A4A-B97A-473D-B09B-7BE1148024C6}"
EndProject
Global
	GlobalSection(SolutionConfigurationPlatforms) = preSolution
		Debug|Any CPU = Debug|Any CPU
		Release|Any CPU = Release|Any CPU
	EndGlobalSection
	GlobalSection(ProjectConfigurationPlatforms) = postSolution
		{99746ED3-10DD-4078-A808-8A3BE423B200}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{99746ED3-10DD-4078-A808-8A3BE423B200}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{99746ED3-10DD-4078-A808-8A3BE423B200}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{99746ED3-10DD-4078-A808-8A3BE423B200}.Release|Any CPU.Build.0 = Release|Any CPU
		{FEE2691A-5EE6-4C53-96DE-31815396A05E}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{FEE2691A-5EE6-4C53-96DE-31815396A05E}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{FEE2691A-5EE6-4C53-96DE-31815396A05E}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{FEE2691A-5EE6-4C53-96DE-31815396A05E}.Release|Any CPU.Build.0 = Release|Any CPU
		{65F97529-61BF-483D-9B13-A94B27F20F0D}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{65F97529-61BF-483D-9B13-A94B27F20F0D}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{65F97529-61BF-483D-9B13-A94B27F20F0D}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{65F97529-61BF-483D-9B13-A94B27F20F0D}.Release|Any CPU.Build.0 = Release|Any CPU
		{B2CF9A4A-B97A-473D-B09B-7BE1148024C6}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{B2CF9A4A-B97A-473D-B09B-7BE1148024C6}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{B2CF9A4A-B97A-473D-B09B-7BE1148024C6}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{B2CF9A4A-B97A-473D-B09B-7BE1148024C6}.Release|Any CPU.Build.0 = Release|Any CPU
	EndGlobalSection
	GlobalSection(SolutionProperties) = preSolution
		HideSolutionNode = FALSE
	EndGlobalSection
	GlobalSection(ExtensibilityGlobals) = postSolution
		SolutionGuid = {865EFE75-B3F3-4F16-90A8-F76207B878B1}
	EndGlobalSection
EndGlobal
