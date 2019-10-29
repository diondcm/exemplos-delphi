import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MyLineChartComponent } from './my-line-chart.component';

describe('MyLineChartComponent', () => {
  let component: MyLineChartComponent;
  let fixture: ComponentFixture<MyLineChartComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MyLineChartComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MyLineChartComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
