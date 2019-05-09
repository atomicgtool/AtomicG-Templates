@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
<h3>@Model.Name.Pluralize().FirstLetterToUpper() Details</h3>
<div><strong>@Model.GetKeyName().FirstLetterToUpper(): </strong>{{ @(Model.Name).@Model.GetKeyName() }}</div>
@foreach (var field in Model.Fields)
{
  if (!field.Key)
  {
  <div><strong>@field.Name.FirstLetterToUpper(): </strong>{{ @(Model.Name).@field.Name @field.GetPipeOrShow()}}</div>
  }
}
<hr />
<a [routerLink]="['/@Model.Name.Pluralize()/update/', @(Model.Name).@Model.GetKeyName()]">Edit</a> |
<a [routerLink]="" (click)="onDeleteUser(@(Model.Name).@Model.GetKeyName())">Delete</a> |
<a routerLink="/@Model.Name.Pluralize()">Back</a>
