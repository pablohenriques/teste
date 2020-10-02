import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EgressoComponent } from './egresso.component';

describe('EgressoComponent', () => {
  let component: EgressoComponent;
  let fixture: ComponentFixture<EgressoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EgressoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EgressoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
