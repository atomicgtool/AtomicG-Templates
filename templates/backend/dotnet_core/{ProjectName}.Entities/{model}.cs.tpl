@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.BackEnd
using System;
using System.Collections.Generic;

namespace @(Model.ProjectName).Entities
{
    public class @Model.Name.FirstLetterToUpper()
    {
@foreach(var field in Model.Fields)
{
<text>
        public @field.GetEntityReturnType() @field.Name.FirstLetterToUpper() { get; set; }
</text>
}    
    }
}
