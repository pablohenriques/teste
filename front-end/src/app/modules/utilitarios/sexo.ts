export class Sexo {
    descricao: string;
    sexo: string;
    
    constructor (descricao: string, sexo: string) {
        this.descricao = descricao;
        this.sexo = sexo;
    }

    static listaSexo = [
        new Sexo('Masculino', 'MASCULINO'),
        new Sexo('Feminino', 'FEMININO'),
        new Sexo('Outros', 'OUTROS')
    ]
}