import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { RetornoApi } from 'src/app/_models/retorno-api';
import { Publicacao } from '../../models/social/publicacao';

@Injectable({
  providedIn: 'root'
})
export class PublicacaoService {

  constructor(private http: HttpClient) { }

    obterPublicacao() {
      return this.http.get<Publicacao>(`${environment.apiUrl}/publicacao/`);
    }

}
