import { Component, OnInit } from '@angular/core';
import { NgxChartsModule } from '@swimlane/ngx-charts';
import { fakeQt } from './fakeData';

@Component({
  selector: 'app-coordenador',
  templateUrl: './coordenador.component.html',
  styleUrls: ['./coordenador.component.css']
})
export class CoordenadorComponent implements OnInit {

  fakeQt: any;

  constructor() {
    Object.assign(this, { fakeQt })
   }

  ngOnInit(): void {
  }

  OnSelect(event){
    console.log(event);
  }
}
