import { NgModule, OnInit } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { EgressoComponent } from './egresso/egresso.component';
import { AuthGuard } from 'src/app/_helpers/auth.guard';
import { CoordenadorComponent } from './coordenador/coordenador.component';

const routes: Routes = [
  {path: 'egresso', component:EgressoComponent, canActivate: [AuthGuard]},
  {path: 'coordenador', component:CoordenadorComponent, canActivate: [AuthGuard]},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }
