# GCP Class 1

Esse repositório é destinado a todo o conteúdo de educação sobre nuvem e o provedor de plataformas em nuvem Google Cloud.

## Requisitos

- Um editor visual de código (recomendado [vscode](https://code.visualstudio.com/Download));
- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) instalado;
- Uma conta no [GitHub](https://github.com);
- [Chaves SSH](https://docs.github.com/pt/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) cadastradas no GitHub;
- **Opcional:** [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) CLI;

## Aprendizes

Cada aprendiz tem um ID, memorize o seu ID pois ele será necessário durante todo o período do curso. O link do ID leva direto para a branch de estudo de cada aprendiz.

| Aprendiz            | ID                                                             | Username              |
| ------------------- | -------------------------------------------------------------- | --------------------- |
| victor.franca       | [8C1C](https://github.com/cloud-journey/gcp-class-1/tree/8C1C) | vflopes               |
| anderson.damasceno  | [FE5A](https://github.com/cloud-journey/gcp-class-1/tree/FE5A) | Anderberserk          |
| antonio.raposo      | [7329](https://github.com/cloud-journey/gcp-class-1/tree/7329) | antoniocarlosraposo   |
| danielle.benites    | [3DF4](https://github.com/cloud-journey/gcp-class-1/tree/3DF4) | danibenites           |
| dejair.santos       | [E4E4](https://github.com/cloud-journey/gcp-class-1/tree/E4E4) | dejair-tech           |
| diego.doi           | [BDEC](https://github.com/cloud-journey/gcp-class-1/tree/BDEC) |                       |
| karla.nascimento    | [97F1](https://github.com/cloud-journey/gcp-class-1/tree/97F1) | Karlaouros            |
| luciano.torquato    | [CFA1](https://github.com/cloud-journey/gcp-class-1/tree/CFA1) | Ltorquato10           |
| luiz.andrade        | [606B](https://github.com/cloud-journey/gcp-class-1/tree/606B) | Luizfvandrade         |
| marisa.cavalcanti   | [A709](https://github.com/cloud-journey/gcp-class-1/tree/A709) |                       |
| paulo.carmo         | [09B0](https://github.com/cloud-journey/gcp-class-1/tree/09B0) | PHCarmo               |
| ricson.sampaio      | [AC1C](https://github.com/cloud-journey/gcp-class-1/tree/AC1C) | RicsonSampaio         |
| thiago.castilho     | [FCF9](https://github.com/cloud-journey/gcp-class-1/tree/FCF9) | ThiCastilho           |
| thomas.bispo        | [3A9D](https://github.com/cloud-journey/gcp-class-1/tree/3A9D) | thomasnakamura        |
| tiago.alexandre     | [B675](https://github.com/cloud-journey/gcp-class-1/tree/B675) | tasale                |
| ygor.pereira        | [7949](https://github.com/cloud-journey/gcp-class-1/tree/7949) |                       |
| guilherme.kojima    | [7F24](https://github.com/cloud-journey/gcp-class-1/tree/7F24) |                       |
| bruno.avelar        | [139D](https://github.com/cloud-journey/gcp-class-1/tree/139D) | AvelarB               |
| claudemir.junior    | [B0AE](https://github.com/cloud-journey/gcp-class-1/tree/B0AE) | claudemirAvelino      |
| elton.luiz          | [F029](https://github.com/cloud-journey/gcp-class-1/tree/F029) | eltonpeixoto          |
| jonatha.brassolatti | [F33E](https://github.com/cloud-journey/gcp-class-1/tree/F33E) | jbrasso               |
| julio.barcellos     | [C4C4](https://github.com/cloud-journey/gcp-class-1/tree/C4C4) |                       |
| klelber.xavier      | [E855](https://github.com/cloud-journey/gcp-class-1/tree/E855) | betodoescher          |
| lucas.praxedes      | [5BC0](https://github.com/cloud-journey/gcp-class-1/tree/5BC0) | LucasPinheiroCarvalho |
| rodrigo.cassiano    | [AB8B](https://github.com/cloud-journey/gcp-class-1/tree/AB8B) | RodCas11              |
| fagner.carvalho     | [C08C](https://github.com/cloud-journey/gcp-class-1/tree/C08C) | Fagner-Carvalho       |
| ricardo.baptista    | [4BF8](https://github.com/cloud-journey/gcp-class-1/tree/4BF8) | ribaptista            |
| elton.ferreira      | [08C7](https://github.com/cloud-journey/gcp-class-1/tree/08C7) | eltonbf               |
| phillipe.morais     | [A6F0](https://github.com/cloud-journey/gcp-class-1/tree/A6F0) |                       |
| dante.mesquita      | [AA31](https://github.com/cloud-journey/gcp-class-1/tree/AA31) |                       |

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

Os pull requests são uma forma de uma pessoa que tem mudanças publicadas em uma branch peça que as mudanças sejam aplicadas a uma outra branch. Iremos utilizar os pull requests para validar e testar os exercícios do curso.

Vamos exemplificar como esse fluxo funciona utilizando o aprendiz `victor.franca` (ID `8C1C`) em um exercício prático.

1. `victor.franca` fez uma nova VPC com terraform na branch **WIP/8C1C/session-1**  localmente em sua máquina;
2. Então ele faz o `commit` e `push` de suas alterações para a branch WIP;
3. Na sequência ele navega até a página de [Pull Requests](https://github.com/cloud-journey/gcp-class-1/pulls) e clica em `New Pull Request`;
4. Na opção de branch `base` ele seleciona sua branch de estudo **8C1C**, na opção `compare` ele escolhe sua branch de trabalho **WIP/8C1C/session-1**;
5. Então clica em `Create Pull Request`;
6. Ele então coloca um título para seu PR descrevendo brevemente o que as alterações representam, no campo descrição são colocados mais detalhes importantes das alterações;
7. Ao lado do botão verde abaixo do campo de descrição `Create pull request`, existe uma setinha apontando para baixo, ele então escolhe criar um `Create draft pull request`, isso indicará que ainda poderá fazer alterações na branch WIP;
8. Quando o `victor.franca` conclui que finalizou o exercício prático, ele clica no botão `Ready for review`;
   1. Isso indicará ao guia que o mesmo poderá avaliar os resultados do exercício, caso alguma modificação precise ser feita, o PR voltará para o estado de "Draft" e seguirá novamente o passo 8;
   2. Ao mesmo tempo, ao indicar que um PR está pronto para ser revisado, o GitHub Actions irá dispará uma automação que valida o código Terraform produzido;
   3. Essa automação também busca valores sensíveis no repositório com o [Gitleaks](https://github.com/zricethezav/gitleaks) e valida alguns parâmetros de qualidade utilizando o [Codacy](https://codacy.com);
9. Após as alterações feitas, a automação de validação obter êxito e a revisão concluída, o guia comenta em um arquivo do PR: `Terraform, go ahead and apply it!`;
   1.  Isso irá disparar uma automação (workflow) no GitHub Actions que irá provisionar sua infraestrutura na nuvem;
   2.  Nesse momento o guia pedirá para que você valide sua infraestrutura agora provisionada na nuvem;
10. Após a validação, o PR é aplicado à branch de estudo (`8C1C`);
    1.  A branch de trabalho (WIP) agora pode ser excluída, já que as alterações estão aplicadas na branch de estudo;
    2.  Ao fechar um PR, o GitHub Actions executará uma automação para remover todos os recursos provisionados na nuvem, já que agora não são mais necessários para o estudo;

## Issues

As issues nesse repositório servem para abrir discussões sobre as sessões de estudo e temas relacionados. Caso você tenha alguma dúvida que não está contemplada em uma issue, sinta-se livre para abrir uma nova explicando a questão para que outras pessoas possam colaborar.

## Milestones

As milestones nesse repositório serão agrupadores das etapas e programação de conteúdo do curso. Você pode ver todas as milestones [clicando aqui](https://github.com/cloud-journey/gcp-class-1/milestones). Através delas podemos marcar pull requests e issues que estão vinculadas gerando automaticamente uma visão de progresso e toda a produção feita durante o curso sobre o tema abordado na milestone.

## Segurança

Não coloque dados sensíveis no repositório como:

- Senhas;
- Dados de credenciais (usuário e senha);
- Dados de acesso (como chaves de API, chaves SSH);

Quando algum dado sensível de saída (output) for gerado no Terraform declare como `sensitive = true`, as instruções para implementar essa funcionalidade estão [aqui](https://www.terraform.io/docs/language/values/outputs.html#sensitive-suppressing-values-in-cli-output).

Os logs gerados pela execução dos workflows pelo GitHub Actions são retidos por 15 dias. Caso você suspeite ou tenha certeza que algum dado sensível foi exposto nos logs do workflow:

1. Copie o link da execução do workflow (exemplo: https://github.com/cloud-journey/gcp-class-1/actions/runs/1131192182);
2. Se possível, tire um print da(s) parte(s) do log onde ocorreu a exposição;
3. Envie o link, os prints se possível, explicando o ocorrido para o dono do repositório (https://github.com/vflopes) pelo Discord ou por e-mail.

## Termos de Uso e Conduta

- Utilize comunicação objetiva e cordial;
- Não utilize esse repositório para projetos pessoais;
- Não utilize esse repositório para conteúdos que não são exclusivamente relacionados ao curso;
- Não será tolerada nenhuma forma de discriminação, ofensa ou qualquer outro tipo de manifestação que possa diminuir, prejudicar ou ofender qualquer pessoa, situações dessa natureza estão sujeitas aos termos da lei vigente;
- Todas as pessoas participando desse curso declaram-se cientes de que os dados gerados e concedidos durante o mesmo são de uso público;