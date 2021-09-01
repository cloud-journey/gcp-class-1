# Session-1
## _Aprofundando nos conceitos sobre nuvem_
Na primeira sessao do workshop Cloud Journey, foi passado para gente os seguinte questionamentos afim de apronfundar nossos conhecimentos.

## 1. O que é uma VPC no GCP?
- O que é uma VPC
_Virtual Private Cloud_ é como o nome diz, uma nuvem privada virtual, é uma nuvem configurável com recursos compartilhados de computação alocados dentro de um ambiente de nuvem pública, fornecendo um nível de isolamento entre os usuarios que estão utilizando os recursos.

- O que é GCP?
_Google Cloud Platform_ é uma suíte (conjunto de ferramentas) de computação em nuvem oferecida pelo Google.

- Como a VPC está inserido dentro do contexto do GCP?
Basicamente o Google Cloud Platform (_GCP_) é uma Virtual Private Cloud (_VPC_), ele proporciona redes globais, escalonáveis e flexíveis para seus recursos e serviços baseados em nuvem.


## 2. Quais são os componentes de uma VPC?
Uma _Virtual Private Cloud_ possui quatro componentes principais _Subnets_, _Internet Gateway_, _NAT Gateway_ e _Route Table_.

- As _subnets_ são espaços de rede que fazem parte da VPC. Essas podem ser ou subnets privadas ou subnets públicas, dependendo da sua configuração. Dependendo do tipo de subnet, o acesso à internet dela é feita de uma forma diferente, seja por Internet Gateway ou NAT Gateway.

- O _Internet Gateway_ é responsável por conectar a VPC com a internet. Todo tráfego de entrada e saída da VPC passa por ele. Ele é a forma de conexão utilizada por subnets públicas. Cada VPC pode ter no máximo um Internet Gateway.

- O _NAT Gateway_ fornece acesso a internet para recursos de subnets privadas. Ele é utilizado para tráfego de saída, expondo um único endereço IP para os endereços externos. O NAT Gateway é provisionado em uma subnet pública, e todo o tráfego externo das subnets privadas passa por ele.

- O _Route Table_ é responsável por definir o comportamento das conexões de uma subnet para o destino correto. É ele que direciona o tráfego externo (0.0.0.0/0) de conexões da internet em subnets públicas para o Internet Gateway, ou que direciona o tráfego externo de uma subnet privada para um NAT gateway.


## 3. Quais são os conceitos com um breve resumo sobre redes que devo me atentar ao pensar em uma VPC?



## 4. Para o que uma VPC serve? Cite um exemplo.



## 5. Quanto custa ter uma VPC no GCP?



## 6. Quais são as opções para aumentar a segurança de uma VPC?



## 7. O que são endereços e intervalos de IP?
- Endereços: Permitem a comunicação dos recursos do Google Cloud com outros recursos no serviço, em redes locais ou na Internet pública.
- Intervalos: Qquando existem diversos serviços em execução na VM, você pode atribuir um IP a cada serviço, como alias.
