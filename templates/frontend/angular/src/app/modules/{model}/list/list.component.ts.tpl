@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
import { Component, OnInit } from '@@angular/core';

import { @Model.Name.FirstLetterToUpper()Service } from '../@(Model.Name).service';
import { @Model.Name.FirstLetterToUpper() } from 'src/app/shared/models/@(Model.Name).model';

@@Component({
  selector: 'app-@Model.Name-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
  })
export class @Model.Name.FirstLetterToUpper()ListComponent implements OnInit {

  @Model.Name.Pluralize(): @(Model.Name.FirstLetterToUpper())[];

  constructor(private @(Model.Name)Service: @Model.Name.FirstLetterToUpper()Service) { }

  ngOnInit() {
    this.get@(Model.Name.Pluralize().FirstLetterToUpper())()
  }

  private get@(Model.Name.Pluralize().FirstLetterToUpper())(): void {
    this.@(Model.Name)Service.get@(Model.Name.Pluralize().FirstLetterToUpper())()
      .subscribe(data => this.@Model.Name.Pluralize() = data.result);
  }
}
