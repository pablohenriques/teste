import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AvaliacoesComponent } from './avaliacoes/avaliacoes.component';
import { AuthGuard } from 'src/app/_helpers/auth.guard';
import { OportunidadeComponent} from "./oportunidade/oportunidade.component";


const routes: Routes = [
  {path: 'avaliacoes', component: AvaliacoesComponent, canActivate: [AuthGuard]},
  {path: 'oportunidades', component: OportunidadeComponent, canActivate: [AuthGuard]}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProfissionalRoutingModule { }
