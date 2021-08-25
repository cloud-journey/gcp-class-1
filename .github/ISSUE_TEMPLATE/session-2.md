---
name: "[session-2]"
about: Segunda sessão
title: "[session-2] Terraform, uma breve introdução"
labels: session, pt-br, pactical
assignees: vflopes

---

# Terraform

O [Terraform](https://www.terraform.io/) é uma ferramenta para provisionar recursos de infraestrutura orquestrando seus possíveis estados através de arquivos de configuração declarativos. A forma mais comum de usá-lo é como uma [CLI](https://pt.wikipedia.org/wiki/Interface_de_linha_de_comandos). Exemplos:

```bash
terraform init # Executa rotinas de inicialização do estado, download de dependências em suas versões e etc
terraform validate # Valida somente os arquivos Terraform quanto a sintaxe e consistência da configuração
terraform plan # Cria o plano de mundaças
terraform apply # Executa as ações do plano de mudanças
terraform destroy # Destrói todos os recursos gerenciados pelo Terraform nessa configuração
```

**Dica:** todos esses comandos aceitam parâmetros, para ver quais são os parâmetros aceitos por cada você pode adicionar um `-h` ao comando ou entrar na página de [referência dos comandos do Terraform](https://www.terraform.io/docs/cli/index.html). O exemplo abaixo é da saída após a execução do comando `terraform plan -h`:

```
Usage: terraform [global options] plan [options]

  Generates a speculative execution plan, showing what actions Terraform
  would take to apply the current configuration. This command will not
  actually perform the planned actions.

  You can optionally save the plan to a file, which you can then pass to
  the "apply" command to perform exactly the actions described in the plan.

Plan Customization Options:

  The following options customize how Terraform will produce its plan. You
  can also use these options when you run "terraform apply" without passing
  it a saved plan, in order to plan and apply in a single command.

  -destroy            Select the "destroy" planning mode, which creates a plan
                      to destroy all objects currently managed by this
                      Terraform configuration instead of the usual behavior.

  -refresh-only       Select the "refresh only" planning mode, which checks
                      whether remote objects still match the outcome of the
                      most recent Terraform apply but does not propose any
                      actions to undo any changes made outside of Terraform.

  -refresh=false      Skip checking for external changes to remote objects
                      while creating the plan. This can potentially make
                      planning faster, but at the expense of possibly planning
                      against a stale record of the remote system state.

  -replace=resource   Force replacement of a particular resource instance using
                      its resource address. If the plan would've normally
                      produced an update or no-op action for this instance,
                      Terraform will plan to replace it instead.

  -target=resource    Limit the planning operation to only the given module,
                      resource, or resource instance and all of its
                      dependencies. You can use this option multiple times to
                      include more than one object. This is for exceptional
                      use only.

  -var 'foo=bar'      Set a value for one of the input variables in the root
                      module of the configuration. Use this option more than
                      once to set more than one variable.

  -var-file=filename  Load variable values from the given file, in addition
                      to the default files terraform.tfvars and *.auto.tfvars.
                      Use this option more than once to include more than one
                      variables file.

Other Options:

  -compact-warnings   If Terraform produces any warnings that are not
                      accompanied by errors, shows them in a more compact form
                      that includes only the summary messages.

  -detailed-exitcode  Return detailed exit codes when the command exits. This
                      will change the meaning of exit codes to:
                      0 - Succeeded, diff is empty (no changes)
                      1 - Errored
                      2 - Succeeded, there is a diff

  -input=true         Ask for input for variables if not directly set.

  -lock=false         Don't hold a state lock during the operation. This is
                      dangerous if others might concurrently run commands
                      against the same workspace.

  -lock-timeout=0s    Duration to retry a state lock.

  -no-color           If specified, output won't contain any color.

  -out=path           Write a plan file to the given path. This can be used as
                      input to the "apply" command.

  -parallelism=n      Limit the number of concurrent operations. Defaults to 10.

  -state=statefile    A legacy option used for the local backend only. See the
                      local backend's documentation for more information.
```

## Arquivos .tf e a HCL

Para escrever um arquivo Terraform que de forma declarativa que pode especificar:

- Variáveis de Entrada ([variables](https://www.terraform.io/docs/language/values/variables.html)): variáveis de entrada são como argumentos para funções.
- Saída de Valores ([outputs](https://www.terraform.io/docs/language/values/outputs.html)): esses valores são como os valores de retorno da função
- Provedores ([providers](https://www.terraform.io/docs/language/providers/index.html)): adicionam suporte no Terraform para novos **tipos de recursos e fontes de dados**.
- Recursos ([resources](https://www.terraform.io/docs/language/resources/index.html)): os recursos são o elemento mais importante no Terraform. Cada bloco de recursos descreve um ou mais objetos de infraestrutura, como redes virtuais, VMs ou componentes de alto nível, como registros DNS.
- Fontes de dados ([data sources](https://www.terraform.io/docs/language/data-sources/index.html)): as fontes de dados permitem que o Terraform use informações definidas fora do Terraform, definidas por outra configuração separada do Terraform ou modificadas por funções.
- Módulos ([modules](https://www.terraform.io/docs/language/modules/index.html)): módulos são agrupadores e interfaces para vários recursos usados juntos.
- Configurações do Terraform e HCL ([terraform](https://www.terraform.io/docs/language/settings/index.html)): o bloco de configuração especial `terraform` é usado para configurar alguns comportamentos do próprio Terraform, como exigir uma versão mínima do Terraform para aplicar sua configuração.

Utilizamos uma linguagem desenvolvida pela Hashicorp chamada [Hashicorp Configuration Language ou HCL](https://github.com/hashicorp/hcl).

## Como o Terraform funciona?

Na própria página da documentação da Hashicorp um ótimo [exemplo do workflow de trabalho com o terraform](https://www.terraform.io/guides/core-workflow.html) é explicado. O Terraform funciona gerenciando os plugins que aumentam suas funcionalidades por provedor, então quando você executa um `terraform init` esse processo de gerenciar e adquirir essas dependências já está abstraído. Esses plugins são responsáveis pela interação com a interface do provedor, no caso do Google Cloud, é a API do mesmo.

Cada plugin também define novos `resources` e `data sources` aceitos pelo Terraform declarados nos nossos arquivos de configuração com HCL. Esse arquivo então é executado, aplicando todas as funcionalidades como funções, condições e loops suportados pela linguagem. Isso gera um estado de saída. Esse estado de saída é comparado com o estado atual da infraestrutura e então é criado um plano de execução. É desse plano de execução inclusive que o Terraform nos dá uma previsão de quais mudanças serão aplicadas.

Uma coisa importante de se perceber é o que Terraform constrói um grafo de relação entre os recursos, ou seja, ele consegue entender se um recurso depende do outro pois algo deve ser criado depois de algo. Algumas vezes esse grafo não consegue ser inferido e temos opções de manualmente dizer quais são as relações de dependências (com o atributo `depends_on`).

A documentação oficial para os recursos (resources) e fontes de dados (data sources) para o provider `google` se encontra [aqui](https://registry.terraform.io/providers/hashicorp/google/latest/docs).

## Um exemplo de estrutura de repositório

Vamos exemplificar com a estrutura repositório para criar um arquivo num bucket na Google Cloud.

**Estrutura de arquivos e pastas de repositório:**

```
--|📄README.md
--|📄backend.tf # Arquivo para especificar onde o Terraform irá salvar o estado da infraestrutura.
--|📄terraform.tf # Arquivo para especificar providers e configurações do terraform.
--|📄main.tf # Para declarar estado dos recursos e módulo da infraestrutura.
--|📄variables.tf # Declaração de variáveis do terraform.
--|📄outputs.tf # Declaração de valores de saída do estado da infraestrutura.
--|📁modules
----|📁meu-modulo
------|📄README.md
------|📄main.tf
------|📄variables.tf
------|📄outputs.tf
```

Exemplo de `/main.tf`:

```hcl
# Isso é um comentário em HCL
# Cria um arquivo em um bucket no GCS (Google Cloud Storage)
# Dica: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object
resource "google_storage_bucket_object" "learner_id_file" {
  name   = "gcp-class/1/${var.learner_id}"
  source = "./learner-id"
  bucket = "cloud-journey"
}
```

Exemplo de `/terraform.tf`:

```hcl
# Especificamos parâmetros do terraform e provedores
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.79.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "3.79.0"
    }
  }
}

provider "google" {
}

provider "google-beta" {
}
```

Exemplo de `/backend.tf`:

```hcl
# Onde o terraform deve armazenar o estado da infraestrutura
terraform {
  backend "gcs" {
    bucket = "cloud-journey"
    prefix = "terraform-state/gcp-class-1"
  }
}
```

Exemplo de `/variables.tf`:

```hcl
# Uma variável de entrada
# Dica: https://www.terraform.io/docs/language/values/variables.html#variable-definition-precedence
variable "learner_id" {
  type        = string
  description = "The learner four-characters identifier"
}
```

Exemplo de `/outputs.tf`:

```hcl
# Um valor de saíde que depende do nosso resource
output "file_md5hash" {
  description = "Uploaded content md5 hash"
  value       = google_storage_bucket_object.learner_id_file.md5hash
}
```

## 👾 Um desafio para as equipes

> Precisamos de uma solução na Google Cloud e ela vai precisar de uma rede!

### Para isso vamos às regras do desafio:

- Devemos utilizar o Terraform;
- Cada equipe criará sua branch nesse repositório a partir da branch `main` (dica: `git checkout main && git pull origin main && git checkout -b WIP/minha-equipe/session-2`);
- A equipe terminar o desenvolvimento do desafio, uma pessoa da equipe deve avisar nessa issue;
- Ao concluir a solução, cada aprendiz da equipe deve abrir um **Pull Request** para puxar as alterações da branch `WIP/minha-equipe/session-2` para a branch com o ID de aprendiz de quem está criando o PR;

### 📀 O que é esperado de resultado do desafio:

1. Que seja criado um recurso [google_compute_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) no arquivo `/main.tf` desse repositório;
2. Que cada campo desse recurso esteja apropriadamente explicado/documento como comentários no próprio arquivo `/main.tf`;
3. Que um PR seja aberto da branch de trabalho da equipe para a branch de aprendiz de cada pessoa da equipe;

### 🚀 Bônus (se for possível entregar, a solução fica mais completa)

1. No arquivo `/variables.tf` uma variável de entrada que é um tipo `string` que coloca um prefixo no nome da rede que é criada no `/main.tf`;
2. Um arquivo `/outputs.tf` que retorna o valor do atributo `.id` do recurso `google_compute_network`;

# Feedback da sessão

Dê uma reação com os emojis para ajudar na melhoria contínua do curso: 

- 🎉 Está incrível!
- ❤️️ Está muito legal!
- 👍 Está legal.
- 👎 Não gostei ou não consegui acompanhar.