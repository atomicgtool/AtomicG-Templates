@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
import { NgModule } from '@@angular/core';
import { CommonModule } from '@@angular/common';
import { FormsModule, ReactiveFormsModule } from '@@angular/forms';

import { @Model.Name.FirstLetterToUpper()CreateComponent } from './create/create.component';
import { @Model.Name.FirstLetterToUpper()DetailComponent } from './detail/detail.component';
import { @Model.Name.FirstLetterToUpper()ListComponent } from './list/list.component';
import { @Model.Name.FirstLetterToUpper()UpdateComponent } from './update/update.component';

import { @Model.Name.FirstLetterToUpper()RoutingModule } from './@Model.Name-routing.module';
import { SharedModule } from 'src/app/shared/shared.module';

@@NgModule({
  declarations: [
    @Model.Name.FirstLetterToUpper()CreateComponent,
    @Model.Name.FirstLetterToUpper()DetailComponent,
    @Model.Name.FirstLetterToUpper()ListComponent,
    @Model.Name.FirstLetterToUpper()UpdateComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    @Model.Name.FirstLetterToUpper()RoutingModule,
    SharedModule
  ]
})
export class @Model.Name.FirstLetterToUpper()Module {}
