@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
import { NgModule } from '@@angular/core';
import { RouterModule, Routes } from '@@angular/router';

import { @Model.Name.FirstLetterToUpper()CreateComponent } from './create/create.component';
import { @Model.Name.FirstLetterToUpper()DetailComponent } from './detail/detail.component';
import { @Model.Name.FirstLetterToUpper()ListComponent } from './list/list.component';
import { @Model.Name.FirstLetterToUpper()UpdateComponent } from './update/update.component';

const @Model.Name.FirstLetterToUpper()Routes: Routes = [
  { path: '@Model.Name.Pluralize()',
    children: [
    {
        path: '',
        component: @Model.Name.FirstLetterToUpper()ListComponent
    },
    {
        path: 'create',
        component: @Model.Name.FirstLetterToUpper()CreateComponent
    },
    {
        path: 'update/:id',
        component: @Model.Name.FirstLetterToUpper()UpdateComponent
    },
    {
        path: ':id',
        component: @Model.Name.FirstLetterToUpper()DetailComponent
    }
    ]
}];

@@NgModule({
  imports: [
    RouterModule.forChild(@Model.Name.FirstLetterToUpper()Routes)
  ],
  exports: [
    RouterModule
  ]
})
export class @Model.Name.FirstLetterToUpper()RoutingModule { }
