@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
using AutoMapper;
using @(Model.ProjectName).Entities;
using @(Model.ProjectName).Web.Dtos;

namespace @(Model.ProjectName).Web.Mappers
{
    public class @Model.Name.FirstLetterToUpper()Profile : Profile
    {
        public @Model.Name.FirstLetterToUpper()Profile()
        {
            CreateMap<@Model.Name.FirstLetterToUpper(), @Model.Name.FirstLetterToUpper()Dto>()
                .ReverseMap();
        }
    }
}
