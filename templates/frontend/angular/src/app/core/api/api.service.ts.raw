import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs/index';

import { environment } from 'src/environments/environment';
import { ApiResponse } from './api.response';

@Injectable({
    providedIn: 'root',
  })
export class ApiService {

  baseUrl = 'api/';

  constructor(private http: HttpClient) { }

  get<T>
    (relativeUrl: string): Observable<ApiResponse<T>> {
    return this.http.get<ApiResponse<T>>(this.baseUrl + relativeUrl);
  }

  getById<T>(relativeUrl: string, id: any): Observable<ApiResponse<T>> {
    return this.http.get<ApiResponse<T>>(this.baseUrl + relativeUrl + id);
  }

  create<T>(relativeUrl: string, payload: T): Observable<ApiResponse<T>> {
    return this.http.post<ApiResponse<T>>(this.baseUrl + relativeUrl, payload);
  }

  update<T>(relativeUrl: string, id: any, payload: T): Observable<ApiResponse<T>> {
    return this.http.put<ApiResponse<T>>(this.baseUrl + relativeUrl + id, payload);
  }

  delete<T>(relativeUrl: string, id: any): Observable<ApiResponse<T>> {
    return this.http.delete<ApiResponse<T>>(this.baseUrl + relativeUrl + id);
  }
}
