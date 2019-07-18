@model AtomicG.Core.Models.TemplateModel
{
  "name": "@Model.ProjectName",
  "version": "@Model.Version",
  "private": true,
  "scripts": {
    "serve": "vue-cli-service serve",
    "build": "vue-cli-service build",
    "lint": "vue-cli-service lint"
  },
  "dependencies": {
    "axios": "^0.19.0",
    "bootstrap": "^4.3.1",
    "core-js": "^2.6.5",
    "jquery": "^3.4.1",
    "moment": "^2.24.0",
    "popper.js": "^1.15.0",
    "vue": "^2.6.10",
    "vue-axios": "^2.1.4",
    "vue-router": "^3.0.6"
  },
  "devDependencies": {
    "@@vue/cli-plugin-babel": "^3.8.0",
    "@@vue/cli-plugin-eslint": "^3.8.0",
    "@@vue/cli-service": "^3.8.0",
    "babel-eslint": "^10.0.1",
    "eslint": "^5.16.0",
    "eslint-plugin-vue": "^5.0.0",
    "vue-template-compiler": "^2.6.10"
  }
}
