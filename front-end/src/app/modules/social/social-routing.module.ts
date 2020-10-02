import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PerfilComponent } from './perfil/perfil.component';
import { AuthGuard } from 'src/app/_helpers/auth.guard';
import { PerfilCadastroComponent } from './perfil/perfil-cadastro/perfil-cadastro.component';
import { PublicacaoComponent } from './publicacao/publicacao.component';
import { PublicacaoCadastroComponent } from './publicacao/publicacao-cadastro/publicacao-cadastro.component';


const routes: Routes = [
  {path: 'perfil', component: PerfilComponent, canActivate: [AuthGuard]},
  {path: 'perfil', component: PerfilComponent, canActivate: [AuthGuard]},
  {path: 'perfil/novo', component: PerfilCadastroComponent, canActivate: [AuthGuard]},
  {path: 'perfil/editar/:id', component: PerfilCadastroComponent, canActivate: [AuthGuard]},
  {path: 'publicacao', component: PublicacaoComponent, canActivate: [AuthGuard] },
  {path: 'publicacao/cadastro', component: PublicacaoCadastroComponent, canActivate: [AuthGuard]},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SocialRoutingModule { }
