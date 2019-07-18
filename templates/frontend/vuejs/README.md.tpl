@model AtomicG.Core.Models.TemplateModel
# @Model.ProjectName

This project was generated with [AtomicG Web Tool](https://www.atomicg.dev/)

## Prerequisites

* [VueJs CLI](https://github.com/vuejs/vue-cli) v3.9.2 or high

## Development server

@if (Model.IntegrateWithBackend != null && Model.IntegrateWithBackend == "Express NodeJs")
{
<text>Run inside `server` folder `npm install` and `npm start` for a dev backend nodejs server. The nodejs server is going to run on `http://localhost:3000/` by default
</text>
<text>Run `npm install` && `npm run serve`. Navigate to `http://localhost:8080/`. The app will automatically reload if you change any of the source files.
</text>
}
else
{
<text>Run `npm install` && `npm run serve` for a dev server. Navigate to `http://localhost:8080/`. The app will automatically reload if you change any of the source files.
</text>
}

