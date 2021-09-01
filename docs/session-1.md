![Logo do R](https://2hvcbhl545p46lgtq2nhxci9-wpengine.netdna-ssl.com/wp-content/uploads/2020/12/google-cloud-logo-1260x300-1.png)

## INTRODUÇÃO

Desde que surgiu a internet, as aplicações precisam ser hospedadas em um servidor. As empresas que cresceram junto com a internet acabaram (para suprir a demanda cada vez maior de processamento) investindo em recursos computacionais e montando os próprios servidores e datacenters (conjunto de servidores). 

Ao notar que tinham um processamento muito maior para a média de processamento que as suas aplicações na época consumiam, montaram um modelo de negócio onde essa infrasestrutura poderia ser alugada por terceiros. Com isso, empresas como google e amazon, por exemplo, criaram aplicações que facilitam o aluguel desses recursos e cada empresa investe em criar produtos que permitam configurar uma rede física, porém alugada, para dar infrasestrutura para suas aplicações. 

Antigamente, cada aplicação tinha que ter sua própria infraestrutura aumentando os gastos com monitoramento, suporte, segurança, manutençao, etc. correndo o risco de, apesar de alto investimento, em algum momento atípico ou sazonal de número de acessos acabar deixando a aplicação fora do ar, gerando prejuízos milionários por segundo até voltar a ficar online. 

Atualmente, podemos alugar essa infraestrutura e o custo de mantê-lo é dividido por todas as aplicações que estão no mesmo servidor, daí o termo nuvem. Ou seja, antigamente as aplicações web rodavam em um servidor, hoje elas rodam na nuvem, que nada mais é que um espaço em um servidor (compartilhado ou não, a segunda alternativa interfere no custo) por outras aplicações.

## LISTA DE ABREVIATURAS

Para entender o conteúdo abaixo precisamos estar familizarizados com alguns conceitos importantes que serão apresentados a seguir. Sendo eles:

| Abreviatura | Descrição |
| ------ | ------ |
| VPC | [Virtual Private Network](https://pt.wikipedia.org/wiki/Virtual_private_cloud) |
| GCP | [Google Cloud Plataform](https://pt.wikipedia.org/wiki/Google_Cloud_Platform) |
| VLAN | [Virtual Local Area Network](https://pt.wikipedia.org/wiki/Virtual_LAN) |
| IP | [Internet Protocol Address](https://pt.wikipedia.org/wiki/Endere%C3%A7o_IP) | 
| VM | [Virtual Machine](https://pt.wikipedia.org/wiki/M%C3%A1quina_virtual) |
| TCP | [Transmission Control Protocol](https://pt.wikipedia.org/wiki/Transmission_Control_Protocol) | 
| UDP | [User Datagram Protocol](https://pt.wikipedia.org/wiki/User_Datagram_Protocol) |
| HTTP | [Hypertext Transfer Protocol](https://pt.wikipedia.org/wiki/Hypertext_Transfer_Protocol) |
| NAT | [Network Address Translation](https://pt.wikipedia.org/wiki/Network_address_translation) 

## O que é uma VPC no GCP?
Uma **Nuvem Privada Virtual** é um produto do **Google Cloud Plataform** que permite que seus contratantes aluguem uma rede física (com todos os seus recursos como firewall, gateway, sub-redes, nats, roteamento, etc.) alocada em um datacenter do google. Com isso, podemos (de forma virtual) montar uma rede similar a física que montaríamos em nossos servidores e roteadores para ter aplicações com alta disponibilidade. Um paralelo que podemos fazer é que antigamente, se alguém quisesse ter água potável a disposição o tempo todo precisaria cavar um poço perto de sua casa. Atualmente, se quisermos água basta abrir a torneira e no final do mês, pagamos a conta conforme o consumo.

Sendo assim, conforme o google define, uma rede **VPC** é um recurso global que consiste em uma lista de sub-redes virtuais regionais em data centers, conectadas por uma rede global de longa distância.

## QUAIS SÃO OS COMPONENTES DE UMA VPC?
Os componentes de uma **VPC** são os mesmos de uma rede física e com recursos a mais que, apenas após a virtualização se tornaram possíveis como balanceamento de carga, por exemplo. Após serem contratados, geralmente, adicionam custo a fatura por consumo e, por serem virtuais podem ser configurados e gerenciados através de uma aplicação (web, console, programa do windows, aplicativo móvel, etc). Segue alguns dos recursos disponíveis em uma **VPC**:

• **Firewall**: Regras e políticas de segurança de um componente (geralmente com um ip address) do **VPC**. 

• **Subnets**: Privadas ou públicas são espaços dinâmicos de rede, seu tamanho pode ser definido pela máscara de rede, por exemplo. Seu tamanho é medido pela quantidade de **IPs** que suporta. Em uma **VPC** tudo isso é configurado de maneira virtual, o valor do plano vai depender do tamanho da rede que for configurada.

• **Internet Gateway**: É responsável por conectar a **VPC** com a internet. Em redes, seria o roteador de borda de uma infraestrutura, responsável por receber o link com empresas fornecedoras de banda e distribuir para os demais dispositivos conectados a ele.

• **NAT Gateway**: É utilizado para o tráfego de saída para subnets privadas. 

• **Route Table**: Em redes seria a configuração de um roteador informando quais **IPs** ele poderá se comunicar. Na **VPC** o conceito é o mesmo podendo ser aplicado para as **VMs**. 


## QUAIS SÃO OS CONCEITOS COM UM BREVE RESUMO SOBRE REDES QUE DEVO ME ATENTAR AO PENSAR EM UMA VPC?
São recursos compartilhados dentro de um ambiente de nuvem pública, onde fornece um certo nível de isolamento entre diferentes organizações (usuários). Esse isolamento acontece em um conjunto de sub-redes que nada mais é que uma divisão de rede grande em redes menores.

Essas redes menores normalmente são feitas através de atribuição de  uma sub-rede **IP** privada e um recurso de comunicação virtual, como uma **VLAN** ou um conjunto de canais de comunicação criptografada para cada organização.

Deve se atentar em manter seus dados privados e protegidos. Por se tratar de uma rede compartilhada e dividida em sub-redes.

## PARA O QUE UMA VPC SERVE? CITE UM EXEMPLO.
**VPC** serve para que várias organizações utilizem uma mesma infra estrutura mas cada organização com suas redes isoladas, por exemplo,
tenho duas organizações acessando o mesmo servidor com as mesmas interfaces de rede e criamos um conjunto de sub-redes para cada uma, dessa forma cada organização pode utilizar esses grupos de **IP** isoladamente com segurança. Ela também fornece conectividade para suas instâncias de máquina Virtual (VM) e oferece sistemas de balanceamento de carga TCP/UDP interno e sistemas de proxy para balanceamento de carga HTTP(S) interno.
Conecta-se a redes locais usando VPN e distribui o tráfego dos balanceadores de carga externos do Google Cloud 

## BÔNUS

## Pergunta Bônus B1: Quanto custa ter uma VPC no GCP?
R

## Pergunta Bônus B2: Quais são as opções para aumentar a segurança de uma VPC?
R:

## Pergunta Bônus B3: O que são endereços e intervalos de IP?
R:

