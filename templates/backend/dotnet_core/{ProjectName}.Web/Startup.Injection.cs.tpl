@model AtomicG.Core.Models.TemplateModel
@using AtomicG.Helper
using @(Model.ProjectName).Core.Services;
using @(Model.ProjectName).Services;
using Microsoft.Extensions.DependencyInjection;

namespace @(Model.ProjectName).Web
{
    public partial class Startup
    {
        private void AddDependencyInjection(IServiceCollection services)
        {
@foreach(var entity in Model.Entities)
{
<text>            services.AddScoped<I@(entity.Name.FirstLetterToUpper())Service, @(entity.Name.FirstLetterToUpper())Service>();
</text>
}
        }
    }
}
