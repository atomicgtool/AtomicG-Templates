@model AtomicG.Core.Models.TemplateModel
@using AtomicG.Helper
import { BrowserModule } from '@@angular/platform-browser';
import { NgModule } from '@@angular/core';
import { HTTP_INTERCEPTORS, HttpClientModule } from '@@angular/common/http';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';

import { TokenInterceptor } from './core/api/interceptor';
import { CoreModule } from './core/core.module';
import { SharedModule } from './shared/shared.module';
@foreach (var entity in Model.Entities)
{
  <text>import { @entity.Name.FirstLetterToUpper()Module } from './modules/@entity.Name/@(entity.Name).module';
  </text>
}

import { HomeComponent } from './modules/home.component';

@@NgModule({
  declarations: [
    AppComponent,
    HomeComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,

    CoreModule,
    SharedModule,

@foreach (var entity in Model.Entities)
{
  <text>    @entity.Name.FirstLetterToUpper()Module,
  </text>
}
    AppRoutingModule
  ],
  providers: [{
    provide: HTTP_INTERCEPTORS,
    useClass: TokenInterceptor,
    multi: true}
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
