import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Perfil } from 'src/app/modules/models/social/perfil';
import { PerfilService } from '../perfil.service';
import { Router, ActivatedRoute } from '@angular/router';
import { isNumber } from 'util';
import { Sexo } from 'src/app/modules/utilitarios/sexo';
import { AuthenticationService } from 'src/app/_services/authentication.service';
import { User } from 'src/app/_models/user';

@Component({
  selector: 'app-perfil-cadastro',
  templateUrl: './perfil-cadastro.component.html',
  styleUrls: ['./perfil-cadastro.component.css']
})
export class PerfilCadastroComponent implements OnInit {

  cadastroForm: FormGroup;

  user: User = new User;
  perfil: Perfil = new Perfil();

  listaSexo: Sexo[] = Sexo.listaSexo;

  alterar: boolean = false;
  loading: boolean = false;

  constructor(
    private formBuilder: FormBuilder,
    private perfilService$: PerfilService,
    private router: Router,
    private route: ActivatedRoute,
    private authenticationService: AuthenticationService
  ) { }

  ngOnInit(): void {
    this.user = this.authenticationService.userValue;
    this.criarFormulario();

    this.route.params.subscribe(params => {

      let id = parseInt(params['id']);
      this.alterar = isNumber(id) && id > 0;
      if (this.alterar) {

        this.perfilService$.obterPorId(id)
          .subscribe(retorno => {
            this.perfil = retorno;
            this.criarFormulario();
          },
            error => alert(error));
      }
    })
  }

  criarFormulario() {
    this.cadastroForm = this.formBuilder.group({
      id: [!this.alterar ? null : this.perfil.id, []],
      nome: [!this.alterar ? null : this.perfil.nome, [Validators.required, Validators.maxLength(100)]],
      sobrenome: [!this.alterar ? null : this.perfil.sobrenome, [Validators.required, Validators.maxLength(100)]],
      sobre: [!this.alterar ? null : this.perfil.sobre],
      sexo: [!this.alterar ? null : this.perfil.sexo],
      telefone: [!this.alterar ? null : this.perfil.telefone, [Validators.maxLength(15)]],
      pais: [!this.alterar ? null : this.perfil.pais, [Validators.maxLength(64)]],
      uf: [!this.alterar ? null : this.perfil.uf, [Validators.maxLength(2)]],
      cidade: [!this.alterar ? null : this.perfil.cidade, [Validators.maxLength(64)]],
      ativo: [!this.alterar ? true : this.perfil.ativo],
      created_at: [!this.alterar ? null : this.perfil.created_at],
      updated_at: [!this.alterar ? null : this.perfil.updated_at]
    });
  }

  limparForm() {
    this.cadastroForm.reset({});
  }

  atualizarDadosObjeto() {
    this.perfil = Object.assign({}, this.perfil, this.cadastroForm.value);
    this.perfil.user = this.user.id;
  }

  onSubmit() {

    this.atualizarDadosObjeto();

    this.loading = true;
    if (this.alterar) { this.atualizar() }
    else { this.adicionar(); }
  }

  adicionar() {
    this.perfilService$.adicionar(this.perfil)
      .subscribe(retorno => {
        this.limparForm();
        this.loading = false;
        this.router.navigate(['/social/perfil']);
      },
        error => {
          alert(error);
          this.loading = false;
        });
  }

  atualizar() {
    this.perfilService$.atualizar(this.perfil, this.perfil.id)
      .subscribe(retorno => {
        this.limparForm();
        this.loading = false;
        this.router.navigate(['/social/perfil']);
      },
        error => {
          let mensagensErro = '';
          for (let err in error.error) {
            mensagensErro += `${err.toUpperCase()}: ${error.error[err][0]} \n`;
          }

          alert(mensagensErro);
          this.loading = false;
        });
  }

}
