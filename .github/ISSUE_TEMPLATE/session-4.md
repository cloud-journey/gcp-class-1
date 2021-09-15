---
name: "[session-4]"
about: Quarta sessão
title: "[session-4] Criando uma máquina bastion na nuvem"
labels: session, pt-br, pactical
assignees: vflopes

---

# Arquitetura

Vamos então finalmente construir o código e automações para uma infraestrutura com máquinas virtuais no GCP. Basicamente o que teremos um cliente com um par de chaves (pública e privada) para se autenticar em uma máquina virtual. Para isso o Firewall da VPC precisa de uma regra que permita o tráfego da internet para a porta 22 em instâncias onde a interface de redes tenha a tag `ssh`. Atente-se para no desenho os nomes que possuem `{leaner_id}` devem ser substituídos dinâmicamente pelo seu **ID de aprendiz** (o arquivo `variables.tf` tem uma variável que carrega esse valor).

```
                       ┌──────────────────────────────────────────────────────────────────────────────────┐
                       │                                                                                  │
                       │  vpc-{learner_id}                                                                │
                       │                                                                                  │
                       │ ┌─────────────────────────────┐   ┌────────────────────────────────────────────┐ │
                       │ │                             │   │ subnet-us-west2-bastion                    │ │
                       │ │     firewall                │   │                                            │ │
                       │ │                             │   │ CIDR: 10.20.30.0/28                        │ │
                       │ │                             │   │   ┌─────────────────────────────────────┐  │ │
                       │ │                             │   │   │ bastion-vm-{learner_id}             │  │ │
                       │ │                             │   │   │                                     │  │ │
                       │ │                             │   │   │  Can IP Forward: yes                │  │ │
┌──────────────┐       │ │                             │   │   │  OS: Debian 10 (buster)             │  │ │
│              │       │ │                             │   │   │  Intance type: e2-micro             │  │ │
│ SSH key pair │       │ │                             │   │   ├───────────────────────────────────┐ │  │ │
│              │       │ ├─────────────────────────────┤   │   │ Network Interface Card (NIC)      │ │  │ │
├──────────────┤       │ │ source: 0.0.0.0/0           │   │   │                                   │ │  │ │
│              │       │ │ destination tag: ssh        │ SSH   │ Must have a public ephemeral IP   │ │  │ │
│    Client    ├───────┼─► allowed: tcp on port 22     ├───┬───► Must have a private IP            │ │  │ │
│              │       │ │                             │   │   │                                   │ │  │ │
└──────────────┘       │ ├─────────────────────────────┤   │   ├───────────────────────────────────┘ │  │ │
                       │ │                             │   │   │                                     │  │ │
                       │ │                             │   │   └─────────────────────────────────────┘  │ │
                       │ │                             │   │                                            │ │
                       │ └─────────────────────────────┘   └────────────────────────────────────────────┘ │
                       │                                                                                  │
                       └──────────────────────────────────────────────────────────────────────────────────┘
```

## Especificações

- **firewall**
  - Regra de firewall que permita todo o tráfego da internet para instâncias com a tag `ssh` na porta `22` e protocolo `TCP`;
- **subnet-us-west-2-bastion**
  - **CIDR:** 10.20.30.0/28;
  - **Região:** us-west2;
- **bastion-vm-{learner_id}**
  - Deve ter IP privado na subnet acima e IP público efêmero;
  - Deve poder fazer forward para outros endereços na rede ([doc do google](https://cloud.google.com/vpc/docs/using-routes?&_ga=2.84287705.-1120514105.1581848761#canipforward), [atributo `can_ip_forward` do recurso no terraform](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#can_ip_forward));
  - **Sistema Operacional:** Debian 10 (buster);
  - **Tamanho do Disco:** 30GB;
  - **Tipo da Instância:** e2-micro;
  - Deve ter tag de rede `ssh` para permitir conexões de sockets TCP na porta 22;
  - Deve aceitar assinaturas da chave pública que você gerou ([pergunta no stackoverflow de como adicionar chaves ssh em uma instância com terraform](https://stackoverflow.com/questions/38645002/how-to-add-an-ssh-key-to-an-gcp-instance-using-terraform));

### 💡 Dica

Você pode achar vários módulos para Terraform [aqui](https://registry.terraform.io/).

## 👾 Um desafio para as equipes

> Precisamos de um código no Terraform que provisione a infraestrutura para a arquitetura apresentada acima, respeitando as configurações de rede e firewall para que eu possa realizar o acesso SSH. Preciso também gerar um par de chaves SSH para acessar minha instância e configurar a instância para aceitar minha conexão.

Existem dois caminhos possíveis para implementar essa arquitetura com Terraform.

### 1. 🎁 Utilizando módulos prontos da comunidade

Quando encontramos uma demanda para implementar alguma arquitetura na nuvem utilizando ferramentas de automação e provisionamento de infraestrutura a primeira coisa que normalmente fazemos é **pesquisar se já existem implementações que são usadas por outras pessoas, equipes e comunidades**. A comunidade de Terraform produz muitos módulos que facilitam bastante a implementação de arquiteturas de uso comum seguindo padrões de boas práticas. Uma dica interessante é entender como o módulo foi construído, lendo o código que está no repositório. Você verá que os módulos são apenas códigos de configuração Terraform.

Para esse desafio, recomendo o uso dos módulos abaixo:

- https://github.com/terraform-google-modules/terraform-google-network para implementar toda a parte de rede e firewall;
- https://github.com/terraform-google-modules/terraform-google-vm para implementar a VM;

### 2. 📦 Escrevendo os próprios módulos de Terraform

Você também pode optar por escrever seus próprios módulos e código utilizando os recursos de cada provedor (`provider`) do terraform. No caso estamos utilizando o [provider para o google](https://registry.terraform.io/providers/hashicorp/google/latest/docs). Na própria [documentação da Hashicorp sobre Terraform](https://www.terraform.io/docs/language/modules/develop/index.html) também é explicado e detalhado como a composição e desenvolvimento de módulos é feita. Pense que nesse caminho, você está optando por construir a arquitetura como código utilizando *APIs de mais baixo nível*, ou componentes mais primários como `data` e `resource`.

Para esse desafio recomendo a leitura sobre os seguintes recursos:

- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance

Recursos adicionais podem ser necessários, utilize a própria documentação do provider para buscá-los.

### 🏅 Para isso vamos às regras do desafio:

- Devemos utilizar o Terraform;
- Cada equipe criará sua branch nesse repositório a partir da branch `main` (dica: `git checkout main && git pull origin main && git checkout -b WIP/minha-equipe/session-4`);
- A equipe terminar o desenvolvimento do desafio, uma pessoa da equipe deve avisar nessa issue;
- Ao concluir a solução, cada aprendiz da equipe deve abrir um **Pull Request** para puxar as alterações da branch `WIP/minha-equipe/session-4` para a branch com o ID de aprendiz de quem está criando o PR;

### 📀 O que é esperado de resultado do desafio:

1. Que a arquitetura seja implementada utilizando o caminho 1 ou 2 nesse repositório;
2. Nas variáveis de entrada para a execução do Terraform deverá ter uma variável que aceita a chave pública SSH que será usada pelo servidor SSH na VM para autenticar as conexões dos usuários;
3. Que um PR seja aberto da branch de trabalho da equipe para a branch de aprendiz de cada pessoa da equipe;

### 🚀 Bônus (se for possível entregar, a solução fica mais completa)

1. Alguns recursos possuem um atribulo `labels`, padronizar as `labels` (que são um conjunto de chave-valores) documentando
2. Um arquivo `/outputs.tf` que retorna o IP público e o IP privado da VM recém-criada;
3. Um script de inicialização na máquina configurado pelo Terraform que instale o [**Docker**](https://docs.docker.com/engine/install/debian/);
4. Uma pasta `docs/` no repositório e nela um arquivo `session-4.md` com a explicação do que é um **"bastion"**;

# Feedback da sessão

Dê uma reação com os emojis para ajudar na melhoria contínua do curso: 

- 🎉 Está incrível!
- ❤️️ Está muito legal!
- 👍 Está legal.
- 👎 Não gostei ou não consegui acompanhar.