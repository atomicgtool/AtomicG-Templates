@model AtomicG.Core.Models.TemplateModel
@using AtomicG.Helper
<header>
  <nav class='navbar navbar-expand-sm navbar-expand-md navbar-light bg-white border-bottom box-shadow mb-3'>
    <div class="container">
      <a class="navbar-brand" [routerLink]='["/"]'>@Model.ProjectName</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-label="Toggle navigation"
              [attr.aria-expanded]="isExpanded" (click)="toggle()">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-collapse collapse d-sm-inline-flex flex-sm-row-reverse">
        <ul class="navbar-nav flex-grow">

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Menu
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              @foreach (var entity in Model.Entities)
              {
                <a class="dropdown-item" routerLink="@entity.Name.Pluralize()">@entity.Name.Pluralize().FirstLetterToUpper()</a>
              }
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>
