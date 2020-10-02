import { Component, OnInit } from '@angular/core';
import { PerfilService } from './perfil.service';
import { Perfil } from '../../models/social/perfil';
import { Router } from '@angular/router';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.component.css']
})
export class PerfilComponent implements OnInit {

  avaliacoes: any;
  perfil: Perfil = new Perfil();
  url: string | any;
  constructor(
    private perfilService$: PerfilService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.obterPerfil();
   
  }

  obterPerfil() {
    this.perfilService$.obterPerfil()
      .subscribe(retorno => {
        this.perfil = retorno;
      },
        error => {
          if (error.status === 404) {
            this.router.navigate(['/social/perfil/novo']);
          }
        });
  }

  onSelectFile(event) {
    if (event.target.files && event.target.files[0]) {
      var reader = new FileReader();

      reader.readAsDataURL(event.target.files[0]); // read file as data url

      reader.onload = (event) => { // called once readAsDataURL is completed
        this.url = event.target.result;
      };
    }
  }

  
}
