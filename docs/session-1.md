- #  Q1. O que é uma VPC no GCP?
   - VPC é um recurso virtualizado que permite a criação de estruturas de redes no GCP.
  
- # Q2. Quais são os componentes de uma VPC?
   - Subnets
   - Elastic network interfaces
   - Route tables
   - Internet gateways
   - Elastic IP addresses
   - VPC endpoints
   - NAT
   - VPC peering
 
- # Q3. Quais são os conceitos com um breve resumo sobre redes que devo me atentar ao pensar em uma VPC?
   - Subnets públicas/privadas: Quais instâncias devem ser acessíveis a partir da Internet?
   - NAT: Quais redes devem conseguir acessar a Internet?
   - VPC peering: Quais redes devem conseguir acessar outras redes?
   - Firewall: quais recursos devem conseguir se comunicar com outros recursos?
  
- # Q4. Para o que uma VPC serve? Cite um exemplo.
  - Permitir comunicação entre recursos do GCP (como VMs, por exemplo) e isolamento de recursos para maior segurança

- # 🚀 Pergunta Bônus B1: Quanto custa ter uma VPC no GCP?
  - Para ter uma VPC é gratuito e não há custo para o tráfego entre recursos de uma mesma zona do Google Cloud utilizando IPs internos. Para recursos que não estão em uma mesma zona ou estão em fora da GCP, o tráfego de entrada (que vai para um recurso no Google Cloud) não é cobrado, mas pode haver custo para processar esse tráfego (como por exemplo um balanceador de carga). O tráfego de saída depende para quem vai (se IP interno ou externo), para qual a zona ou região, se sai do Google Cloud e a distância que percorre até sair do Google Cloud.

- # 🚀 Pergunta Bônus B2: Quais são as opções para aumentar a segurança de uma VPC?
   - As opções para aumentar a segurança são ACLs e VPC Service Controls e regras de firewall.
  
- # 🚀 Pergunta Bônus B3: O que são endereços e intervalos de IP?
   - Endereços são uma espécie de "identificador" que utilizamos para registrar um dispositivo em uma Rede, e Intervalos IP, são faixas/ranges, que uma rede ou sub-rede possui, para determinar quais são os dispositivos que estão na mesma rede, ou fora dela.
