@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
import { Component, OnInit } from '@@angular/core';
import { ActivatedRoute, Router } from '@@angular/router';
import { FormBuilder, FormGroup, FormArray, FormControl, Validators} from '@@angular/forms';
import { Observable } from 'rxjs';

import { ApiResponse } from 'src/app/core/api/api.response';

import { @(Model.Name.FirstLetterToUpper())Service } from '../@(Model.Name).service';
import { @Model.Name.FirstLetterToUpper() } from 'src/app/shared/models/@(Model.Name).model';
@foreach (var field in Model.Fields)
{
  if (!field.IsBasicType())
  {
<text>
import { @field.EntityType().FirstLetterToUpper()Service } from '../../@field.EntityType().ToLower()/@(field.EntityType().ToLower()).service';
import { @field.EntityType().FirstLetterToUpper() } from 'src/app/shared/models/@(field.EntityType().ToLower()).model';
</text>
  }
}

@@Component({
  selector: 'app-@Model.Name-update',
  templateUrl: './update.component.html',
  styleUrls: ['./update.component.scss']
})
export class @Model.Name.FirstLetterToUpper()UpdateComponent implements OnInit {

  edit@(Model.Name.FirstLetterToUpper())Form: FormGroup;
@foreach (var field in Model.Fields)
{
  if (!field.IsBasicType())
  {
<text>  @field.Name.Pluralize(): @(field.EntityType().FirstLetterToUpper())[];
</text>
  }
}

  constructor(private formBuilder: FormBuilder, private route: ActivatedRoute, private router: Router,
    private @(Model.Name)Service: @Model.Name.FirstLetterToUpper()Service,
@foreach (var field in Model.Fields)
{
  if (!field.IsBasicType())
  {
<text>    private @field.EntityType().ToLower()Service: @field.EntityType().FirstLetterToUpper()Service,
</text>
  }
}
  ) { }

  ngOnInit() {
   this.get@(Model.Name.FirstLetterToUpper())Details(this.route.snapshot.params.@Model.GetKeyName())
      .subscribe(data => {
        const @Model.Name = data.result
      
        this.edit@(Model.Name.FirstLetterToUpper())Form = this.formBuilder.group({
          @Model.GetKeyName(): [],
@foreach (var field in Model.Fields)
{
  if (!field.Key)
  {
<text>          @field.Name: @field.GetUpdateInitForm(Model.Name),
</text>
  }
}
      });

      this.edit@(Model.Name.FirstLetterToUpper())Form.patchValue({
@foreach (var field in Model.Fields)
{
  if (field.IsBasicType())
  {
<text>        @field.Name: @(Model.Name).@field.Name,
</text>
  }
}
      });
    });
  }

  private get@(Model.Name.FirstLetterToUpper())Details(@Model.GetKeyName(): @Model.GetKeyType()): Observable<ApiResponse<@Model.Name.FirstLetterToUpper()>> {
    return this.@(Model.Name)Service.get@(Model.Name.FirstLetterToUpper())(@Model.GetKeyName());
  }

  onSubmit(): void {
@if (Model.HasMuchRelations())
{
  foreach (var field in Model.GetMuchRelations())
  {
<text>    this.edit@(Model.Name.FirstLetterToUpper())Form.value.@field.Name.Pluralize() = this.getSelected@(field.Name.FirstLetterToUpper().Pluralize())();
</text>
  }
}
    this.@(Model.Name)Service.update@(Model.Name.FirstLetterToUpper())(this.edit@(Model.Name.FirstLetterToUpper())Form.value.@Model.GetKeyName(), this.edit@(Model.Name.FirstLetterToUpper())Form.value)
      .subscribe(data => {
        this.router.navigate(['/@Model.Name.Pluralize()']);
      });
  }
@if (Model.HasMuchRelations())
{
  foreach (var field in Model.GetMuchRelations())
  {
<text>
  private add@(field.Name.FirstLetterToUpper())Checkboxes(@Model.Name: @Model.Name.FirstLetterToUpper()) : FormArray { 
    const checkboxes = new FormArray([]);

    this.@field.EntityType().ToLower()Service.get@(field.Name.FirstLetterToUpper().Pluralize())()
      .subscribe(data => {
        this.@field.Name.Pluralize() = data.result;
        this.@(field.Name.Pluralize()).map((@field.Name.Singularize()) => {
          const control = new FormControl(@(Model.Name).@(field.Name.Pluralize()).some((r) => r.@field.Show === @(field.Name.Singularize()).@field.Show));
          checkboxes.push(control);
        });
      });
      
    return checkboxes;
  }
      
  private getSelected@(field.Name.FirstLetterToUpper().Pluralize())(): @field.GetReturnType() {
    return this.edit@(Model.Name.FirstLetterToUpper())Form.value.@field.Name.Pluralize()
      .map((checked, index) => checked ? this.@(field.Name.Pluralize())[index] : null)
        .filter(value => value !== null);
  }
</text>      
  }
}
@if (Model.HasOneRelations())
{
  foreach (var field in Model.GetOneRelations())
  {
<text>
  private add@(field.Name.FirstLetterToUpper())Combobox(@Model.Name: @Model.Name.FirstLetterToUpper()): FormControl {
    this.@field.EntityType().ToLower()Service.get@(field.Name.FirstLetterToUpper().Pluralize())()
      .subscribe(data => {
        this.@field.Name.Pluralize() = data.result;
      });
      
    return new FormControl(@(Model.Name).@field.Name);
  }
      
  compare@(field.Name.FirstLetterToUpper().Pluralize())(@field.EntityType().ToLower()1: @field.EntityType().FirstLetterToUpper(), @field.EntityType().ToLower()2: @field.EntityType().FirstLetterToUpper()): boolean {
    return @field.EntityType().ToLower()1.@field.Show === @field.EntityType().ToLower()2.@field.Show;
  }
</text>      
  }
}
}
