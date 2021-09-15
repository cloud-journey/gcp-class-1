## Q1. Qual o padrão de nomenclatura devemos adotar para nomear os recursos de redes que serão provisionados?

O nome de uma VPC deve obedecer certas regras:
- Pode conter apenas letras minúsculas, números e/ou hífens;
- Deve começar com letra minúscula;
- Não pode terminar com hífen;
- Pode ter no máximo 62 caracteres;

Com isso em mente, devemos utilizar um padrão de nomenclatura simples, intuitiva e consistente.

##### Exemplo:

- Nome da empresa: Groove tech – groove
- Unidade de negócios: Tecnologia da Informação – ti
- Código do aplicativo: dispatcher jira – disp
- Código da região: northamerica-northeast1 – na-ne1, europe-west1 – eu-we1
- Códigos de ambiente: dev, test, uat, stage, prod

Neste exemplo, o ambiente de produção do dispatcher jira, departamento de tecnologia da informação é chamado de: 

- groove-ti-disp-na-ne1-prod.

## Q2. Quais são as vantagens e funcionalidades de uma SDN?

Uma SDN (Software Defined Network) funciona abstraindo o hardware através de uma NOS (Network Operation System, também chamado de SDN Controller). Em cima do NOS roda aplicações que definem o que ocorre com os pacotes (por exemplo, para onde vão e qual a prioridade deles). Quando um equipamento (como um roteador, por exemplo) recebe um pacote, ele verifica as regras que já tem armazenadas. Se já existir alguma regra que se aplica aquele pacote, ele a executa. Se não encontrar nenhuma regra, ele questiona o NOS, que irá instruí-lo sobre o que fazer (e a regra será armazenada no equipamento por um tempo para evitar perguntar novamente).

Uma SDN tem como vantagens:
- Separação entre pacotes de controle e pacotes de dados;
- Centralização lógica do gerenciamento (tornando mais fácil mudar uma tabela de roteamento, por exemplo);
- Flexibilidade e dinamismo;
- Visão holística da rede;
- Programável (permite autoescalar para cima ou para baixo dependendo do tráfego, por exemplo);
- Compatibilidade com vários equipamentos;

## Q3. Quais são os tipos de regras de firewall e o que cada tipo impacta na VPC?

A direção de uma regra de firewall pode ser de entrada ou saída. A direção sempre é definida da perspectiva da VM a que a regra de firewall se aplica (o destino).
A direção de entrada descreve as conexões enviadas de uma origem para uma meta. Regras de entrada se aplicam a pacotes de novas sessões em que o destino do pacote é a meta.
A direção de saída descreve o tráfego enviado de uma meta para um destino. Regras de saída se aplicam a pacotes de novas sessões em que a origem do pacote é a meta.
Se não houver especificação da direção, o Google Cloud usará a entrada.

## 🚀 Pergunta Bônus B1: O que é um NAT Gateway e quais as vantagens do serviço Cloud NAT do Google?

Um gateway NAT é um serviço de Network Address Translation (NAT – Conversão de endereços de rede). Você pode usar um gateway NAT para que as instâncias em uma sub-rede privada possam se conectar a serviços fora da VPC, mas os serviços externos não podem iniciar uma conexão com essas instâncias.
O Cloud Nat tem benefícios como:
- Segurança
- Disponibilidade
- Escalabilidade
- Desempenho


## 🚀 Pergunta Bônus B2: Quais são os tipos de endereço de IP (externos e internos) que o Google Cloud disponibiliza e qual a diferença de cada um?

Os tipos de endereço IP que o Google fornece para os IPs internos e externos são IPs estáticos e temporários. Os IPs estáticos são atribuídos até que o usuário libere-o. Os IPs temporários são liberados automaticamente se a instância for desligada ou terminada e se a regra de encaminhamento for excluída.


## 🚀 Pergunta Bônus B3: Quais os serviços o Google tem para promover segurança para VPC?

Os serviços são Google Cloud Firewalls e VPC Services Controls

