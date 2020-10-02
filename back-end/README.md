# XSI - BACKEND

[![pipeline status](https://gitlab.com/ceulp-dsi/xsi/badges/master/pipeline.svg)](https://gitlab.com/ceulp-xsi/xsi/commits/master)

## Preparando o ambiente de desenvolvimento
> Testado no ubuntu 18.04 e [WSL](https://docs.microsoft.com/pt-br/windows/wsl/about).

### Instalando o Pyenv

Recomenda-se a instalação da ferramenta [_pyenv_](https://github.com/pyenv/pyenv) para facilitar o isolamento das dependências Python. Para fazer a instalação basta executar o comando:
``` bash
$ curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
```
> Ao fim da instalação, alguma instrução para adicionar `PYENV_ROOT` (ou algo semelhante) às suas variáveis de ambiente pode aparecer no terminal, então fique atento. Acesse a [documentação](https://github.com/pyenv/pyenv#installation) do pyenv para mais detalhes.


Agora instale a versão 3.8.2 do Python através do pyenv com o comando:
``` bash
$ pyenv install 3.8.2
```

Instale o plugin pyenv [_pyenv-virtualenv_](https://github.com/pyenv/pyenv-virtualenv) para gerenciar ambientes virtuais:
``` bash
$ git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
```
Feito isso, agora podemos isolar nosso ambiente de desenvolvimento criando um  *virtualenv* a partir da versão do Python instalada anteriormente, basta executar o comando:
``` bash
$ pyenv virtualenv 3.8.2 xsi-3.8.2
```


## Clonando o projeto

Para fazer um clone do projeto para sua maquina local use o comando:
``` bash
$ git clone git@gitlab.com:ceulp-dsi/xsi.git xsi
```
Executando as instruções a seguir você vai definir o *virtualenv* criado anteriormente como o padrão para este projeto. Não é obrigatório, mas é bem conveniente.
``` bash
$ cd xsi/back-end
$ pyenv local xsi-3.8.2
```

## Configurando o ambiente local

### Requisitos Python

Para o gerenciamento das dependências do Python, este projeto utiliza o [_poetry_](https://python-poetry.org/). Para instalar esta ferramenta, utilize este comando:
``` bash
$ curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
```
> Reinicie seu terminal para utilizar o poetry. Se reiniciar o terminal não funcionar, talvez seja necessário reiniciar a seção do usuário. Consulte a [documentação](https://python-poetry.org/docs/#installation) do poetry para mais detalhes.

Caso o *virtualenv* ainda não esteja ativado, faça-o pelo comando:
```bash
$ pyenv activate xsi-3.8.2
```

E então, instale as dependências dentro do ambiente virtual ativado.
```bash
$ poetry install
```

### Variáveis de ambiente
No diretório do projeto `src/backend/` crie um arquivo `.env` com as variáveis de ambiente.
``` bash
DEBUG=value
LOG_LEVEL=value
SECRET_KEY=value
DATABASE_URL=value
```

### Autoformatador e ferramenta de QA

Este projeto utiliza o autoformatador de código Python [_autopep8_](https://github.com/hhatto/autopep8) para padronizar a formatação do código fonte e, para validação da qualidade do código, foi configurado o [_pylint_](https://pypi.org/project/pylint/).

Copie e cole estas configurações do workspace do projeto em  `.vscode/settings.json`.
``` json
{
  "python.pythonPath": "/home/exemplo/.pyenv/versions/xsi-3.8.2/bin/python",
  "python.linting.pylintEnabled": true,
  "python.formatting.provider": "autopep8",
  "python.formatting.autopep8Args": [
	"--aggressive",
  ],
  "python.linting.pylintArgs": [
	"--load-plugins",
	"pylint_django",
  ],
  "python.autoComplete.extraPaths": [
	"${workspaceRoot}/src",
  ],
  "python.sortImports.args": [
	"-ns",
	"__init__.py",
  ],
  "[python]": {
	"editor.formatOnSave": true,
  },
}
```