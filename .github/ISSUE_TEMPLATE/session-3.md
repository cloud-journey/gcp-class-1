---
name: "[session-3]"
about: Terceira sessão
title: "[session-3] Visão geral sobre os recursos básicos de redes"
labels: session, pt-br, conceptual
assignees: vflopes

---

# O contexto de redes na nuvem

Antes de falar um pouco mais sobre redes na nuvem, vamos falar um pouco de redes e como essa parte da tecnologia se desenvolveu para suportar as operações de grandes volumes de indicadores de conectividade como acontece hoje em dia nas clouds. A rede de comunicação de dispositivos, ou rede de computadores, ou de forma encurtada, rede (redes no plural) são uma forma de comunicação de dispositivos e aplicações para compartilhar recursos, recursos esses normalmente disponibilizados em "nós" na própria rede.

Para que essa comunicação ocorra de forma íntegra, eficiente e segura, esses dispositivos e aplicações implementam regras de protocolos para comunicação, definindo assim a forma de transmissão e interpretação dos dados que trafegam pela rede. Exemplo de protocolos: **HTTP(S), gRPC, OpenAPI, QUIC, TLS, UDP, TCP, ICMP, IP**. Claro, estamos aqui falando de vários protocolos que estão contidos em diferentes camadas do [modelo OSI](https://pt.wikipedia.org/wiki/Modelo_OSI).

<img src="https://infosys.beckhoff.com/content/1033/tf6310_tc3_tcpip/Images/png/84433547__en-US__Web.png" />

## Como isso tudo é implementado?

Estamos falando de muitos detalhes de implementação de cada arquitetura para redes e se formos para o campo das soluções de segurança, armazenamento e distribuição de capacidade computacional com otimização para aplicações com tecnologias específicas, uma pergunta surge: **como fazer tudo isso fisicamente? Ou seja, qual a operação envolvendo hardware para isso tudo ser viável?**

<img src="https://www.researchgate.net/profile/A-U-Rehman/publication/332945839/figure/fig1/AS:756285154811907@1557323840303/Traditional-Hardware-based-Network-Appliances-Approach-Versus-NFV-Approach.png" />

Uma das respostas é que começamos a virtualizar dispositivos de redes e começamos então a gerenciar a implementação de arquitetura, engenharia e operação de redes através de software, como abordagens como [SDN](https://www.vmware.com/br/topics/glossary/content/software-defined-networking.html) e [NFV](https://www.vmware.com/br/topics/glossary/content/network-functions-virtualization-nfv.html).

Entender como os avanços em redes possibilitaram a escala que a nuvem alcançou é muito importante, afinal, um dos recursos que mais falamos sobre é a VPC, que em sua tradução de *Virtual Private Cloud* é *Nuvem Privada Virtual*.

# Como tornamos uma rede no Google Cloud funcional?

Primeiramente criamos uma VPC Network (VPC somente ou Network somente, tem o mesmo significado). Em seguida criamos as subredes nessa VPC onde o siginificado dependerá da topologia adotada para comunicação entre os nós, das regras de segurança e segregação de redes e também da distribuição física (localizações e regiões).

Lembre-se, uma VPC no Google é um recurso global, uma subnet (subnetwork ou subrede) é um recurso regional. É importante falar também do [firewall](https://cloud.google.com/vpc/docs/firewalls) logo no início, afinal, **segurança é um assunto que nunca se deixa para depois.** No GCP, o firewall está diretamente relacionado com uma VPC de forma também global.

A partir desse momento as operações de provisionamento e configuração dependem dos requerimentos da arquitetura que está sendo implementada.

## Uma pausa para conceitos importantes

Você sabe o que é **[taxonomia](https://pt.wikipedia.org/wiki/Taxonomia_(geral))** e **[convenção de nomenclatura (nesse link tem um exemplo do que o Google utiliza para as APIs de sua nuvem)](https://cloud.google.com/apis/design/naming_convention?hl=pt)**? Com esses dois conceitos conseguimos criar critérios para nomenclatura dos recursos que estamos provisionando na nuvem. Lembre-se: `o segredo de uma boa implementação de padronização é a consistência.`

## Um desafio para as equipes

1. Cada equipe criará uma documentação com base nas questões listadas, as questões bônus são opcionais;
2. A pessoa que está como guia deverá então criar uma **branch WIP** com o seguinte formato: `WIP/nome_da_equipe/session-3`;
3. Nessa branch a equipe deverá criar uma pasta `docs/` no repositório e nela um arquivo `session-3.md`;
4. No ponto em que a equipe considera finalizado uma pessoa deverá comentar nessa issue com o nome da **branch WIP**;

**👾 Então para as perguntas do desafio:**

- **Q1.** Qual o padrão de nomenclatura devemos adotar para nomear os recursos de redes que serão provisionados?
- **Q2.** Quais são as vantagens e funcionalidades de uma SDN?
- **Q3.** Quais são os tipos de **regras de firewall** e o que cada tipo impacta na VPC?
- **🚀 Pergunta Bônus B1:** O que é um NAT Gateway e quais as vantagens do serviço Cloud NAT do Google?
- **🚀 Pergunta Bônus B2:** Quais são os tipos de endereço de IP (externos e internos) que o Google Cloud disponibiliza e qual a diferença de cada um?
- **🚀 Pergunta Bônus B3:** Quais os serviços o Google tem para promover segurança para VPC?

Nesse arquivo estruture um conteúdo para que como uma boa documentação, objetiva e simples, responde as dúvidas acima para alguém que está aprendendo.

# Feedback da sessão

Dê uma reação com os emojis para ajudar na melhoria contínua do curso: 

- 🎉 Está incrível!
- ❤️️ Está muito legal!
- 👍 Está legal.
- 👎 Não gostei ou não consegui acompanhar.