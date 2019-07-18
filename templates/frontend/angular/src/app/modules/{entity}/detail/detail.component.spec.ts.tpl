@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
import { async, ComponentFixture, TestBed } from '@@angular/core/testing';

import { @Model.Name.FirstLetterToUpper()DetailComponent } from './detail.component';

describe('@Model.Name.FirstLetterToUpper()DetailComponent', () => {
  let component: @Model.Name.FirstLetterToUpper()DetailComponent;
  let fixture: ComponentFixture<@Model.Name.FirstLetterToUpper()DetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ @Model.Name.FirstLetterToUpper()DetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(@Model.Name.FirstLetterToUpper()DetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
