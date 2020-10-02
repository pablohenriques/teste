import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import {OportunidadeService} from '../oportunidade/oportunidade.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-oportunidade',
  templateUrl: './oportunidade.component.html',
  styleUrls: ['./oportunidade.component.css']
})
export class OportunidadeComponent implements OnInit {
  oportunidades = null;
  oportunidade:any ={
    "titulo": null,
    "descricao": null,
    "dataExpiracao": null,
    "local": null,
    "categoria": null
};



  todasOportunidades:any;
  cadastroForm: FormGroup;

  tipos = [' ','CLT', 'PJ', 'Estágio', 'Mestrado', 'Doutorado', 'Evento', 'Freelancer'];

  constructor(
    private formBuilder: FormBuilder,
    private oportunidadeService$: OportunidadeService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.obterTodosOportunidade();
    this.criaFormulario();
    
  }

  criaFormulario(){
    this.cadastroForm = this.formBuilder.group({
      titulo: ['' , [Validators.required]],
      descricao: ['',  [Validators.required]],
      data_expiracao: ['', [Validators.required]],
      local: ['' ,[Validators.required]],
      categoria: ['' ,[Validators.required]],

    });
  }
  
  adicionar() {
    this.oportunidadeService$.adicionar(this.cadastroForm.value)
      .subscribe(retorno => {
        this.limparForm();
        this.router.navigate(['/profissional/oportunidades']);
      }),
      error => {
        alert(error);
      
      }
      location.reload();
      
  }
  onSubmit() {
    this.adicionar();
   
  }
  limparForm() {
    this.cadastroForm.reset({});
  }

  obterTodosOportunidade(){
    this.oportunidadeService$.obterTodos()
    .subscribe(lista => this.oportunidades = lista.results);
  }

  obterOportunidade(id){
    this.oportunidadeService$.obter(id)
    .subscribe((oportunidade) => this.oportunidade = oportunidade);
  }
}
