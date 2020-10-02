import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { RetornoApi } from 'src/app/_models/retorno-api';

@Injectable({
  providedIn: 'root'
})
export class OportunidadeService {

  constructor(private http: HttpClient) { }

  adicionar(oportunidade) {
    return this.http.post(`${environment.apiUrl}/oportunidades/`, oportunidade);
  }
  obterTodos() {
    return this.http.get<RetornoApi<any>>(`${environment.apiUrl}/oportunidades/`);
  }

  obter(id) {
    return this.http.get(`${environment.apiUrl}/oportunidades/${id}/`);
  }
}
