Descrição

## Tipos de commit

| Tipo de commit (module) | Descrição                | Release                                                                                                                     |
| ----------------------- | ------------------------ | --------------------------------------------------------------------------------------------------------------------------- |
| `feat()`                | Uma nova feature         | `minor`                                                                                                                     |
| `fix()`                 | Correção de bugs         | `patch`                                                                                                                     |
| `docs()`                | Documentação             | `patch`se o `escopo` for `readme`                                                                                           |
| `style()`               | Formatação de código     | Alterações que não afetam o significado do código (espaços em branco, identação, ponto-e-virgula, etc)                      |
| `refactor()`            | Refatoração de código    | Alteração no código que não corrige um bug, e nem adiciona uma feature                                                      |
| `perf()`                | Melhorias de performance | Alteração no código que melhora a performance                                                                               |
| `build()`               | Builds                   | Alterações que afetam o sistema de build, ou dependências externas (escopos exemplares: gulp, broccoli, yarn, npm, webpack) |
| `ci()`                  | Integração continua (CI) | Alteração aos arquivos de configuração e scripts do CI (escopos exemplares: travis, circleci, browserstack, saucelabs)      |
| `chore()`               | Chores                   | Outras mudanças que não modificam os arquivos da aplicação ou dos testes                                                    |
| `revert()`              | Reversão de commit       | Reversão a um commit anterior                                                                                               |

## Algumas Boas práticas

1. Adicionar Resolver apenas quando necessário
2. Remover qualquer biblioteca não utilizada do `package.json`
3. Utilizar TSlint
