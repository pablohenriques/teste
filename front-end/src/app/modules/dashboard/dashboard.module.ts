import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NgxChartsModule } from '@swimlane/ngx-charts';

import { DashboardRoutingModule } from './dashboard-routing.module';
import { EgressoComponent } from './egresso/egresso.component';
import { CoordenadorComponent } from './coordenador/coordenador.component';


@NgModule({
  declarations: [EgressoComponent, CoordenadorComponent],
  imports: [
    CommonModule,
    NgxChartsModule,
    DashboardRoutingModule
  ]
})
export class DashboardModule { }
