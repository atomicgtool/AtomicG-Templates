@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
import { Component, OnInit } from '@@angular/core';
import { FormBuilder, FormGroup, FormArray, FormControl, Validators } from '@@angular/forms';
import { ActivatedRoute, Router } from '@@angular/router';

import { @Model.Name.FirstLetterToUpper()Service } from '../@(Model.Name).service';
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
  selector: 'app-@Model.Name-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.scss']
  })
export class @Model.Name.FirstLetterToUpper()CreateComponent implements OnInit {

  add@(Model.Name.FirstLetterToUpper())Form: FormGroup;
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
    this.add@(Model.Name.FirstLetterToUpper())Form = this.formBuilder.group({
      @Model.GetKeyName(): [],
@foreach (var field in Model.Fields)
{
  if (!field.Key)
  {
<text>      @field.Name: @field.GetCreateInitForm(),
</text>
  }
}
    });
  }

  onSubmit(): void {
@if (Model.HasMuchRelations())
{
  foreach (var field in Model.GetMuchRelations())
  {
<text>    this.add@(Model.Name.FirstLetterToUpper())Form.value.@field.Name.Pluralize() = this.getSelected@(field.Name.FirstLetterToUpper().Pluralize())();
</text>
  }
}
    this.@(Model.Name)Service.create@(Model.Name.FirstLetterToUpper())(this.add@(Model.Name.FirstLetterToUpper())Form.value)
      .subscribe(data => {
        this.router.navigate(['/@Model.Name.Pluralize()']);
      });
  }
@if (Model.HasMuchRelations())
{
  foreach (var field in Model.GetMuchRelations())
  {
<text>
   private add@(field.Name.FirstLetterToUpper().Pluralize())Checkboxes() : FormArray { 
     const checkboxes = new FormArray([]);
   
     this.@field.EntityType().ToLower()Service.get@(field.Name.FirstLetterToUpper().Pluralize())()
       .subscribe(data => {
         this.@field.Name.Pluralize() = data.result;
         this.@(field.Name.Pluralize()).map(() => {
           const control = new FormControl(false);
           checkboxes.push(control);
         });
       });
   
     return checkboxes;
   }
   
   private getSelected@(field.Name.FirstLetterToUpper().Pluralize())(): @field.GetReturnType() {
     return this.add@(Model.Name.FirstLetterToUpper())Form.value.@field.Name.Pluralize()
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
  private add@(field.Name.FirstLetterToUpper())Combobox(): FormControl {
    this.@field.EntityType().ToLower()Service.get@(field.Name.FirstLetterToUpper().Pluralize())()
     .subscribe(data => {
       this.@field.Name.Pluralize() = data.result;
     });
   
     return new FormControl();
  }
</text>
  }
}
}
