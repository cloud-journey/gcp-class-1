# gcp-class-1 ---- chamacocos
## _Perguntas do desafio:_

#### Q1. O que é uma VPC no GCP?
R: A nuvem privada virtual (VPC) oferece funcionalidades de rede para instâncias de máquina virtual (VM) do Compute Engine, clusters do Google Kubernetes Engine (GKE) e o ambiente flexível do App Engine. A VPC proporciona redes globais, escalonáveis e flexíveis para seus recursos e serviços baseados em nuvem.
#### Q2. Quais são os componentes de uma VPC?

R: Subnets
VPC peering
Elastic network interfaces
Route tables
Internet gateways
Elastic IP addresses
VPC endpoints
NAT

#### Q3. Quais são os conceitos com um breve resumo sobre redes que devo me atentar ao pensar em uma VPC?
R: 
Subnets 
NAT Como criar rotas e acessos a ambientes privados 

Firewall: controlar todo aceso a sua rede
#### Q4. Para o que uma VPC serve? Cite um exemplo.
R: A VPC compartilhada permite que uma organização conecte recursos de vários projetos a uma rede de nuvem privada virtual (VPC) 
####  🚀 Pergunta Bônus B1: Quanto custa ter uma VPC no GCP?

R: Se for na regiao de IOWA 
Primeiras cinco regras de encaminhamento    US$ 0,025    Por hora
Por regra de encaminhamento adicional    US$ 0,010    Por hora
Dados de entrada processados pelo balanceador de carga    US$ 0,008    Por GB

####  🚀 Pergunta Bônus B2: Quais são as opções para aumentar a segurança de uma VPC?
R: mplementem uma prática recomendada de segurança de menor privilégio para a administração de rede, auditoria e controle de acesso. Os administradores de VPCs compartilhadas podem delegar tarefas de administração de rede a administradores de rede e segurança na rede VPC compartilhada sem permitir que os administradores de projetos de serviços façam alterações com impacto na rede. Os administradores de projetos de serviços só têm a capacidade de criar e gerenciar instâncias que fazem uso da rede VPC compartilhada. Consulte a seção administradores e IAM para ver mais detalhes.
####  🚀 Pergunta Bônus B3: O que são endereços e intervalos de IP?
R: são ranges, que uma rede ou sub-rede possui, para determinar quais são os dispositivos que estão na mesma rede, ou fora dela e IPs identificam elementos na rede hosts, smartphones repetidores