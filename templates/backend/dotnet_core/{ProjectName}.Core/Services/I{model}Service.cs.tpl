@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
using @(Model.ProjectName).Entities;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace @(Model.ProjectName).Core.Services
{
    public interface I@(Model.Name.FirstLetterToUpper())Service
    {
        Task<List<@Model.Name.FirstLetterToUpper()>> GetAll@(Model.Name.FirstLetterToUpper().Pluralize())Async();

        Task<@Model.Name.FirstLetterToUpper()> Get@(Model.Name.FirstLetterToUpper())ByIdAsync(Guid id);

        Task<@Model.Name.FirstLetterToUpper()> Create@(Model.Name.FirstLetterToUpper())Async(@Model.Name.FirstLetterToUpper() @Model.Name);

        Task Update@(Model.Name.FirstLetterToUpper())Async(@Model.Name.FirstLetterToUpper() @Model.Name);

        Task Delete@(Model.Name.FirstLetterToUpper())Async(@Model.Name.FirstLetterToUpper() @Model.Name);
    }
}
