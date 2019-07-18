@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
import { Component, OnInit } from '@@angular/core';
import { ActivatedRoute, Router } from '@@angular/router';

import { @Model.Name.FirstLetterToUpper()Service } from '../@(Model.Name).service';
import { @Model.Name.FirstLetterToUpper() } from 'src/app/shared/models/@(Model.Name).model';
@foreach (var field in Model.Fields)
{
  if (!field.IsBasicType())
  {
<text>import { @field.EntityType().FirstLetterToUpper() } from 'src/app/shared/models/@(field.EntityType()).model';
</text>
  }
}

@@Component({
  selector: 'app-@Model.Name-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.scss']
})
export class @Model.Name.FirstLetterToUpper()DetailComponent implements OnInit {

  @Model.Name: @Model.Name.FirstLetterToUpper() = {
    @foreach (var field in Model.Fields)
    {
<text>    @field.Name: @field.GetDefaultValue(),
</text>
    }
  };

  constructor(private route: ActivatedRoute, private router: Router, private @(Model.Name)Service: @Model.Name.FirstLetterToUpper()Service) { }

  ngOnInit() {
    this.get@(Model.Name.FirstLetterToUpper())Details(this.route.snapshot.params.@Model.GetKeyName());
  }

  private get@(Model.Name.FirstLetterToUpper())Details(@Model.GetKeyName(): @Model.GetKeyType()) {
    this.@(Model.Name)Service.get@(Model.Name.FirstLetterToUpper())(@Model.GetKeyName())
      .subscribe(data => {
        this.@Model.Name = data.result;
      });
  }

  onDelete@(Model.Name.FirstLetterToUpper())(@Model.GetKeyName(): @Model.GetKeyType()) {
    if (confirm('Are you sure to delete this @Model.Name')) {
      this.@(Model.Name)Service.delete@(Model.Name.FirstLetterToUpper())(@Model.GetKeyName())
        .subscribe(data => {
          this.router.navigate(['/@Model.Name.Pluralize()']);
        });
    }
  }
}
