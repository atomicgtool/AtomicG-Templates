@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.BackEnd
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using @(Model.ProjectName).Core.Services;
using @(Model.ProjectName).Entities;

namespace @(Model.ProjectName).Services
{
    public class @Model.Name.FirstLetterToUpper()Service : I@(Model.Name.FirstLetterToUpper())Service
    {
        public Task<List<@Model.Name.FirstLetterToUpper()>> GetAll@(Model.Name.FirstLetterToUpper().Pluralize())Async()
        {
            return Task.FromResult((List<@Model.Name.FirstLetterToUpper()>)null);
        }

        public Task<@Model.Name.FirstLetterToUpper()> Get@(Model.Name.FirstLetterToUpper())ByIdAsync(@Model.GetKeyType() id)
        {
            return Task.FromResult((@Model.Name.FirstLetterToUpper())null);
        }

        public Task<@Model.Name.FirstLetterToUpper()> Create@(Model.Name.FirstLetterToUpper())Async(@Model.Name.FirstLetterToUpper() @Model.Name)
        {
            return Task.FromResult(@Model.Name);
        }

        public Task Update@(Model.Name.FirstLetterToUpper())Async(@Model.Name.FirstLetterToUpper() @Model.Name)
        {
            return Task.CompletedTask;
        }

        public Task Delete@(Model.Name.FirstLetterToUpper())Async(@Model.Name.FirstLetterToUpper() @Model.Name)
        {
            return Task.CompletedTask;
        }
    }
}
