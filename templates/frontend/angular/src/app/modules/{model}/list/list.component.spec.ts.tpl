@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
import { async, ComponentFixture, TestBed } from '@@angular/core/testing';

import { @Model.Name.FirstLetterToUpper()ListComponent } from './list.component';

describe('@Model.Name.FirstLetterToUpper()ListComponent', () => {
  let component: @Model.Name.FirstLetterToUpper()ListComponent;
  let fixture: ComponentFixture<@Model.Name.FirstLetterToUpper()ListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ @Model.Name.FirstLetterToUpper()ListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(@Model.Name.FirstLetterToUpper()ListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
