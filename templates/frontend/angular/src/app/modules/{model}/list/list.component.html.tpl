@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
<h3>@Model.Name.Pluralize().FirstLetterToUpper()</h3>

<a routerLink="/@Model.Name.Pluralize()/create">Create new @Model.Name.FirstLetterToUpper()</a>
<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">@Model.GetKeyName().FirstLetterToUpper()</th>
              @foreach (var field in Model.Fields)
              {
                if (!field.Key)
                {
                  <th scope="col">@field.Name.FirstLetterToUpper()</th>
                }                
              }
                  <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <tr *ngFor="let @Model.Name of @Model.Name.Pluralize()">
                <th scope="row">{{ @(Model.Name).@Model.GetKeyName() }}</th>
              @foreach (var field in Model.Fields)
              {
                if (!field.Key)
                {
                <td>{{ @(Model.Name).@field.Name @field.GetPipeOrShow()}}</td>
                }
              }
                <td>
                    <a [routerLink]="[@(Model.Name).@Model.GetKeyName()]">Details</a> |
                    <a [routerLink]="['/@Model.Name.Pluralize()/update/', @(Model.Name).@Model.GetKeyName()]">Edit</a>
                </td>
            </tr>

        </tbody>
    </table>
</div>
