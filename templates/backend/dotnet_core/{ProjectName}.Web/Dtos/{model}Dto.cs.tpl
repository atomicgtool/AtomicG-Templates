@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.BackEnd
using System;
using System.Collections.Generic;

namespace @(Model.ProjectName).Web.Dtos
{
    public class @Model.Name.FirstLetterToUpper()Dto
    {
@foreach(var field in Model.Fields)
{
<text>        public @field.GetDtoReturnType() @field.Name.FirstLetterToUpper() { get; set; }
</text>
}        
    }
}
