@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
@foreach (var field in Model.Fields)
{
  if (!field.IsBasicType())
  {
    <text>import { @field.EntityType() } from './@(field.EntityType().ToLower()).model';
    </text>
  }
}

export class @Model.Name.FirstLetterToUpper() {
@foreach (var field in Model.Fields)
{
  <text>  @(field.Name): @field.GetReturnType();
  </text>
}
}
