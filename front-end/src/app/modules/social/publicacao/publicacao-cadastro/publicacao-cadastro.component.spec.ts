import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PublicacaoCadastroComponent } from './publicacao-cadastro.component';

describe('PublicacaoCadastroComponent', () => {
  let component: PublicacaoCadastroComponent;
  let fixture: ComponentFixture<PublicacaoCadastroComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PublicacaoCadastroComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PublicacaoCadastroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
