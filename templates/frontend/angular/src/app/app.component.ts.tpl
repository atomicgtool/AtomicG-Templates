@model AtomicG.Core.Models.TemplateModel
import { Component } from '@@angular/core';

@@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = '@Model.ProjectName';
}
