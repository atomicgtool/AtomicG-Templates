@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
using @(Model.ProjectName).Web.Dtos;
using FluentValidation;

namespace @(Model.ProjectName).Web.Validations
{
    public class @Model.Name.FirstLetterToUpper()Validator : AbstractValidator<@Model.Name.FirstLetterToUpper()Dto>
    {
        public @Model.Name.FirstLetterToUpper()Validator()
        {
@foreach(var field in Model.Fields)
{
    if (field.Required)
    {
<text>            RuleFor(x => x.@field.Name.FirstLetterToUpper()).NotNull();
</text>
    }
}
        }
    }
}
