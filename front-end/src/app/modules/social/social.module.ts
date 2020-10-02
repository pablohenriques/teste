import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SocialRoutingModule } from './social-routing.module';
import { PerfilComponent } from './perfil/perfil.component';
import { PerfilCadastroComponent } from './perfil/perfil-cadastro/perfil-cadastro.component';
import { ReactiveFormsModule } from '@angular/forms';
import { PublicacaoCadastroComponent } from './publicacao/publicacao-cadastro/publicacao-cadastro.component';


@NgModule({
  declarations: [PerfilComponent, PerfilCadastroComponent, PublicacaoCadastroComponent],
  imports: [
    CommonModule,
    SocialRoutingModule,
    ReactiveFormsModule
  ]
})
export class SocialModule { }
