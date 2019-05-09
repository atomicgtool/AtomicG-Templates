@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
import { Injectable } from '@@angular/core';
import { Observable, of } from 'rxjs';

import { @Model.Name.FirstLetterToUpper() } from 'src/app/shared/models/@(Model.Name).model';
import { ApiService } from 'src/app/core/api/api.service';
import { ApiResponse } from 'src/app/core/api/api.response';

@@Injectable({
  providedIn: 'root',
})
export class @Model.Name.FirstLetterToUpper()Service {

  relativeURL = '@Model.Name.Pluralize()';

  constructor(private apiService: ApiService) {
  }

  get@(Model.Name.Pluralize().FirstLetterToUpper())(): Observable<ApiResponse<@(Model.Name.FirstLetterToUpper())[]>> {
    return this.apiService.get<@(Model.Name.FirstLetterToUpper())[]>(this.relativeURL);
  }

  get@(Model.Name.FirstLetterToUpper())(@Model.GetKeyName(): @Model.GetKeyType()): Observable<ApiResponse<@Model.Name.FirstLetterToUpper()>> {
    return this.apiService.getById<@Model.Name.FirstLetterToUpper()>(this.relativeURL, @Model.GetKeyName());
  }

  create@(Model.Name.FirstLetterToUpper())(@Model.Name: @Model.Name.FirstLetterToUpper()): Observable<ApiResponse<any>> {
    return this.apiService.create<any>(this.relativeURL, @Model.Name);
  }

  update@(Model.Name.FirstLetterToUpper())(@Model.GetKeyName(): @Model.GetKeyType(), @Model.Name: @Model.Name.FirstLetterToUpper()): Observable<ApiResponse<any>> {
    return this.apiService.update<any>(this.relativeURL, @Model.GetKeyName(), @Model.Name);
  }

  delete@(Model.Name.FirstLetterToUpper())(@Model.GetKeyName(): @Model.GetKeyType()): Observable<ApiResponse<any>> {
    return this.apiService.delete<any>(this.relativeURL, @Model.GetKeyName());
  }
}
