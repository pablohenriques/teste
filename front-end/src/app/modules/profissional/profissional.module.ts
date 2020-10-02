import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ProfissionalRoutingModule } from './profissional-routing.module';
import {OportunidadeComponent} from "./oportunidade/oportunidade.component";
import { AvaliacoesComponent} from "./avaliacoes/avaliacoes.component";

@NgModule({
  declarations: [OportunidadeComponent,AvaliacoesComponent],
  imports: [
    CommonModule,
    ProfissionalRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ]
})
export class ProfissionalModule { }
