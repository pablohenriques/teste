import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import {PerfilService} from '../../social/perfil/perfil.service';
import { AvaliacoesService} from "../avaliacoes/avaliacoes.service";
import { Router, ActivatedRoute } from '@angular/router';
import { JwtInterceptor} from '../../../_helpers/jwt.interceptor';

@Component({
  selector: 'app-avaliacoes',
  templateUrl: './avaliacoes.component.html',
  styleUrls: ['./avaliacoes.component.css']
})
export class AvaliacoesComponent implements OnInit {

  cadastroForm: FormGroup;
  idPerfil: any;
  cadastroAvaliacao: any;
  constructor(
    private formBuilder: FormBuilder,
    private perfilService$: PerfilService,
    private avaliacoesService$: AvaliacoesService,
    private router: Router,
    private route: ActivatedRoute
  ) { }
  

  ngOnInit(): void {
    this.criaFormulario();

    this.route.params.subscribe(params => {

      let id = parseInt(params['id']);

        this.perfilService$.obterPorId(id)
          .subscribe(retorno => {
            this.idPerfil = retorno;
            console.log(retorno)
          }), error => alert(error)
      
    })
  }

  criaFormulario(){
    this.cadastroForm = this.formBuilder.group({
      descricao: ['' , [Validators.required]],
      perfil_avaliado:[1],
     
      
    });

    console.log(this.idPerfil)
    
  }
  adicionar() {
    console.log(this.cadastroForm.value)
    this.cadastroAvaliacao = this.cadastroForm.value;
    

    this.avaliacoesService$.adicionar(this.cadastroForm.value)
      .subscribe(retorno => {
        this.router.navigate(['/social/perfil']);
      }),
      error => {
        alert(error);
      
      }
      
  }
  onSubmit() {
   
    this.adicionar();
    console.log(this.cadastroForm.value)
  }
}
