import { Component, OnInit } from '@angular/core';
import { NgxChartsModule } from '@swimlane/ngx-charts';
import { fakeAlunos } from './fakeData';

@Component({
  selector: 'app-egresso',
  templateUrl: './egresso.component.html',
  styleUrls: ['./egresso.component.css']
})
export class EgressoComponent implements OnInit {

  fakeAlunos: any[];
  view: any[] = [950, 300];

  // options
  x = true;
  y = true;
  gradient = false;
  mostrarLegenda = true;
  mostrarXLabel = true;
  xLabel = 'Curso';
  mostrarYLabel = true;
  yLabel = 'Alunos';

  colorScheme = {
    domain: ['#5AA454', '#A10A28', '#C7B42C', '#AAAAAA']
  };

  constructor() {
    Object.assign(this, { fakeAlunos })
   }

  ngOnInit(): void {

  }

  onSelect(event) {
    console.log(event);
  }

}
