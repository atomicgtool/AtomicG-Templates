@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
import { async, ComponentFixture, TestBed } from '@@angular/core/testing';

import { @Model.Name.FirstLetterToUpper()CreateComponent } from './create.component';

describe('@Model.Name.FirstLetterToUpper()CreateComponent', () => {
  let component: @Model.Name.FirstLetterToUpper()CreateComponent;
  let fixture: ComponentFixture<@Model.Name.FirstLetterToUpper()CreateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ @Model.Name.FirstLetterToUpper()CreateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(@Model.Name.FirstLetterToUpper()CreateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
