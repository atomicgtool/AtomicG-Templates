@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
import { async, ComponentFixture, TestBed } from '@@angular/core/testing';

import { @Model.Name.FirstLetterToUpper()UpdateComponent } from './update.component';

describe('@Model.Name.FirstLetterToUpper()UpdateComponent', () => {
  let component: @Model.Name.FirstLetterToUpper()UpdateComponent;
  let fixture: ComponentFixture<@Model.Name.FirstLetterToUpper()UpdateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ @Model.Name.FirstLetterToUpper()UpdateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(@Model.Name.FirstLetterToUpper()UpdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
