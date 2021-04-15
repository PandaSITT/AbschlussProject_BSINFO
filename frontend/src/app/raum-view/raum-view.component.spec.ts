import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RaumViewComponent } from './raum-view.component';

describe('RaumViewComponent', () => {
  let component: RaumViewComponent;
  let fixture: ComponentFixture<RaumViewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RaumViewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RaumViewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
