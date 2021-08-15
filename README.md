# GCP Class 1

Esse repositório é destinado a todo o conteúdo de educação sobre nuvem e o provedor de plataformas em nuvem Google Cloud.

## Requisitos

- Um editor visual de código (recomendado [vscode](https://code.visualstudio.com/Download));
- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) instalado;
- Uma conta no [GitHub](https://github.com);
- [Chaves SSH](https://docs.github.com/pt/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) cadastradas no GitHub;
- **Opcional:** [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) CLI;

## Aprendizes

| Aprendiz            | ID   |
| ------------------- | ---- |
| victor.franca       | 8C1C |
| anderson.damasceno  | FE5A |
| antonio.raposo      | 7329 |
| danielle.benites    | 3DF4 |
| dejair.santos       | E4E4 |
| diego.doi           | BDEC |
| karla.nascimento    | 97F1 |
| luciano.torquato    | CFA1 |
| luiz.andrade        | 606B |
| marisa.cavalcanti   | A709 |
| paulo.carmo         | 09B0 |
| ricson.sampaio      | AC1C |
| thiago.castilho     | FCF9 |
| thomas.bispo        | 3A9D |
| tiago.alexandre     | B675 |
| ygor.pereira        | 7949 |
| guilherme.kojima    | 7F24 |
| bruno.avelar        | 139D |
| claudemir.junior    | B0AE |
| elton.luiz          | F029 |
| jonatha.brassolatti | F33E |
| julio.barcellos     | C4C4 |
| klelber.xavier      | E855 |
| lucas.praxedes      | 5BC0 |
| rodrigo.cassiano    | AB8B |

## Branches

Nesse repositório cada aprendiz tem uma branch nomeada com o ID do aprendiz, exemplo: `8C1C` é a branch de estudo do aprendiz **victor.franca**.

Quando você for trabalhar em alguma atividade prática do curso, sempre comece a partir da sua branch:

```bash
# Define a branch atual local utilizando o ID do aprendiz
git checkout 8C1C
# Faz o download de qualquer atualização remota na branch do aprendiz
git pull origin 8C1C
```

Ao começar o trabalho, crie uma de trabalho a partir da sua utilizando o prefixo `WIP` (work in progress) um sufixo da sessão:

```bash
git checkout 8C1C
git pull origin 8C1C
# Cria uma nova branch a partir da branch do aprendiz
git checkout -b WIP/8C1C/session-1
```

Ao terminar as atividades práticas você deve realizar o `commit` e `push` das suas alterações para o servidor remoto git (GitHub):

```bash
git add ./
git commit -m "Descreva suas alterações aqui"
git push origin WIP/8C1C/session-1
```

## Pull Requests

## Segurança

Não coloque dados sensíveis no repositório como:

- Senhas;
- Dados de credenciais (usuário e senha);
- Dados de acesso (como chaves de API, chaves SSH);

Quando algum dado sensível de saída (output) for gerado no Terraform declare como `sensitive = true`, as instruções para implementar essa funcionalidade estão [aqui](https://www.terraform.io/docs/language/values/outputs.html#sensitive-suppressing-values-in-cli-output).

Os logs gerados pela execução dos workflows pelo GitHub Actions é de 15 dias. Caso você suspeite ou tenha certeza que algum dado sensível foi exposto nos logs do workflow:

1. Copie o link da execução do workflow (exemplo: https://github.com/cloud-journey/gcp-class-1/actions/runs/1131192182);
2. Se possível, tire um print da(s) parte(s) do log onde ocorreu a exposição;
3. Envie o link, os prints se possível, explicando o ocorrido para o dono do repositório (https://github.com/vflopes) pelo Discord ou por e-mail.