@model AtomicG.Core.Models.TemplateModel
using AutoMapper;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
@if (Model.IntegrateWithFrontend != null && Model.IntegrateWithFrontend == "Angular")
{
<text>using Microsoft.AspNetCore.SpaServices.AngularCli;</text>
}
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
@if (Model.IntegrateWithFrontend != null && Model.IntegrateWithFrontend == "VueJs")
{
<text>using VueCliMiddleware;
</text>
}
namespace @(Model.ProjectName).Web
{
	public partial class Startup
	{
		public Startup(IConfiguration configuration)
		{
			Configuration = configuration;
		}

		public IConfiguration Configuration { get; }

		// This method gets called by the runtime. Use this method to add services to the container.
		public void ConfigureServices(IServiceCollection services)
		{
			this.AddDependencyInjection(services);

			services.AddAutoMapper();

			services.AddMvc()
				.SetCompatibilityVersion(CompatibilityVersion.Latest)
				.AddFluentValidation(fv => fv.RegisterValidatorsFromAssemblyContaining<Startup>());
@if (Model.IntegrateWithFrontend != null && (Model.IntegrateWithFrontend == "Angular" || Model.IntegrateWithFrontend == "VueJs"))
{
<text>
			// In production, the Angular files will be served from this directory
			services.AddSpaStaticFiles(configuration =>
			{
			@if (Model.IntegrateWithFrontend == "Angular")
			{
<text>          configuration.RootPath = "ClientApp/dist";
</text>
			}
			else
			{
<text>          configuration.RootPath = "ClientApp/public";
</text>
			}
			});
</text>
}
		}

		// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
		public void Configure(IApplicationBuilder app, IHostingEnvironment env)
		{
			if (env.IsDevelopment())
			{
				app.UseDeveloperExceptionPage();
			}
			else
			{
@if (Model.IntegrateWithFrontend != null && Model.IntegrateWithFrontend == "Angular")
{
<text>				app.UseExceptionHandler("/Error");
</text>
}
				// The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
				app.UseHsts();
			}

			app.UseHttpsRedirection();
@if (Model.IntegrateWithFrontend == null)
{
<text>
			app.UseMvc();
</text>
}
else
{
<text>
			app.UseStaticFiles();
			app.UseSpaStaticFiles();

			app.UseMvc(routes =>
			{
				routes.MapRoute(name: "default", template: "{controller}/{action=Index}/{id?}");
			});

			app.UseSpa(spa =>
			{
				// To learn more about options for serving an Angular SPA from ASP.NET Core,
				// see https://go.microsoft.com/fwlink/?linkid=864501

				spa.Options.SourcePath = "ClientApp";

				if (env.IsDevelopment())
				{
					@if (Model.IntegrateWithFrontend == "Angular")
					{
<text>                   spa.UseAngularCliServer(npmScript: "start");
</text>
					}
					else
					{
<text>                   spa.UseVueCli(npmScript: "serve", port: 8080);
</text>
					}
				}
			});
</text>
}
		}
	}
}
