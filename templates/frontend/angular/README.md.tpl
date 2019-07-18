@model AtomicG.Core.Models.TemplateModel
# @Model.ProjectName

This project was generated with [AtomicG Web Tool](https://www.atomicg.dev/)

## Prerequisites

* [Angular CLI](https://github.com/angular/angular-cli) version 7.3.5 or high

## Development server

@if (Model.IntegrateWithBackend != null && Model.IntegrateWithBackend == "Express NodeJs")
{
<text>Run inside `server` folder `npm install` and `npm start` for a dev backend nodejs server. The nodejs server is going to run on `http://localhost:3000/` by default
</text>
<text>Run `npm install` && `ng serve --proxy-config proxy.conf.json` for a dev frontend angular server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.
</text>
}
else
{
<text>Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.
</text>
}

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
