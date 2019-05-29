@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
<h3>Update @Model.Name.FirstLetterToUpper()</h3>

<form [formGroup]="edit@(Model.Name.FirstLetterToUpper())Form" (ngSubmit)="onSubmit()">
    <div class="hidden">
        <input type="hidden" formControlName="@Model.GetKeyName()" placeholder="@Model.GetKeyName()" name="@Model.GetKeyName()" class="form-control" id="@Model.GetKeyName()">
    </div>
  @foreach (var field in Model.Fields)
  {
    if (field.Key)
    {
      continue;
    }
    if (field.IsBasicType())
    {
    <div class="form-group">
        <label for="inputName">@field.Name.FirstLetterToUpper()</label>
		@if (field.EntityType() == "Date")
		{
		<input type="date" name="@field.Name" formControlName="@field.Name" class="form-control" id="@field.Name">
		}
		else
		{
        <input name="@field.Name" formControlName="@field.Name" class="form-control" id="@field.Name">
		}
    </div>
    }
  }
  @if (Model.HasMuchRelations())
  {    foreach (var field in Model.GetMuchRelations())
    {
  <div class="form-group">
        <label for="inputName">@field.Name.FirstLetterToUpper().Pluralize()</label>
        <div formArrayName="@field.Name.Pluralize()" *ngFor="let @field.Name of addUserForm.controls.@(field.Name.Pluralize()).controls; let i = index">
          <input type="checkbox" [formControlName]="i" [value]="@field.Name">{{ @(field.Name.Pluralize())[i].@field.Show }}
        </div>
  </div>
    }
  }
  @if (Model.HasOneRelations())
  {
    foreach (var field in Model.GetOneRelations())
    {
  <div class="form-group">
        <label for="inputName">@field.Name.FirstLetterToUpper()</label>
        <select [compareWith]="compare@(field.Name.FirstLetterToUpper().Pluralize())" formControlName="@field.Name" class="form-control">
          <option *ngFor="let @field.Name of @field.Name.Pluralize()" [ngValue]="@field.Name">
            {{ @(field.Name).@field.Show }}
          </option>
        </select>
  </div>
    }
  }

    <button class="btn btn-primary" [disabled]="edit@(Model.Name.FirstLetterToUpper())Form.invalid">Update</button> |
    <a routerLink="/@Model.Name.Pluralize()">Back</a>
</form>
