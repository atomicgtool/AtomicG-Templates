@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
<h3>Create @Model.Name.FirstLetterToUpper()</h3>

<form [formGroup]="add@(Model.Name.FirstLetterToUpper())Form" (ngSubmit)="onSubmit()">
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
  {
    foreach (var field in Model.GetMuchRelations())
    {
  <div class="form-group">
        <label for="inputName">@field.Name.FirstLetterToUpper().Pluralize()</label>
        <div formArrayName="@field.Name.Pluralize()" *ngFor="let @field.Name.Singularize() of addUserForm.controls.@(field.Name.Pluralize()).controls; let i = index">
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
        <select formControlName="@field.Name" class="form-control">
          <option *ngFor="let @field.Name of @field.Name.Pluralize()" [ngValue]="@field.Name">
            {{ @(field.Name).@field.Show }}
          </option>
        </select>
  </div>
    }
  }
    <button class="btn btn-primary" [disabled]="add@(Model.Name.FirstLetterToUpper())Form.invalid">Create</button> |
    <a routerLink="/@Model.Name.Pluralize()">Back</a>
</form>
