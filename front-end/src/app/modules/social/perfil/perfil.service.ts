import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { RetornoApi } from 'src/app/_models/retorno-api';
import { Perfil } from '../../models/social/perfil';

@Injectable({
  providedIn: 'root'
})
export class PerfilService {

  constructor(private http: HttpClient) { }

  obterPerfil() {
    return this.http.get<Perfil>(`${environment.apiUrl}/perfil/`);
  }

  obterPorId(id: number) {
    return this.http.get<Perfil>(`${environment.apiUrl}/perfil/${id}/`);
  }

  adicionar(perfil: Perfil) {
    return this.http.post(`${environment.apiUrl}/perfil/`, perfil);
  }

  atualizar(perfil: Perfil, id: number) {
    return this.http.put(`${environment.apiUrl}/perfil/${id}/`, perfil);
  }
  

}
