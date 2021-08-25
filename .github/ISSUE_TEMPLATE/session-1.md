---
name: "[session-1]"
about: Primeira sessão
title: "[session-1] Formando as equipes e aprofundando nos conceitos sobre nuvem"
labels: session, pt-br, conceptual
assignees: vflopes

---

# Formação de equipes

As equipes serão formadas por grupos de 5 pessoas com a seguinte metodologia:

1. A pessoa guia pegará a tabela de aprendizes do `README.md` da branch `main`;
2. Então utilizará o serviço https://www.random.org/lists/ para randomizar a lista;
3. Da lista randomizada serão formadas equipes a cada 5 aprendizes de cima para baixo;
4. Ao final caso o número de pessoas seja menor do que 5, cada uma será distribuida por uma equipe de cima para baixo;
5. Todas as pessoas então deverão entrar no grupo do **Discord** que quem guia especificar;
6. Essa pessoa enviará um convite para se tornar sua amiga e poder criar os grupos das equipes;
7. **Aceite o convite de amizade 😊**;
8. Nos grupos agora vocês deverão definir dois nomes possíveis para a equipe utilizando [esse site](https://colornames.org/fresh/) ou [esse site](https://pt.wikipedia.org/wiki/Lista_de_povos_ind%C3%ADgenas_do_Brasil), uma dica: caso encontre algum termo com mais de uma palavra, pegue somente uma palvra do termo para ser o nome da equipe;

**📋 Os resultados deverão ser apresentados logo abaixo.**

# O que a Cloud resolve e como?

Imagine que você começou uma empresa, com apenas um servidor na sua infraestrutura para suportar a demanda de usuários que você espera no pico do seu negócio. Então seu negócio cresce e a demanda se mantém dinâmica, com vales e picos de acessos de usuários. Você então desenvolve mais features, isso impacta mais uma vez no crescimento da sua infraestrutura.

Em um certo ponto dessa história de crescimento e suporte aos picos de demanda, você já tem uma infraestrutura gigantesca com distribuição de capacidade global ou regional e para atender as variações da sua demanda, você acaba mantendo uma capacidade de computação ociosa muito grande, o que em caso de ociosidade gera custos.

Mas perceba, existe uma capacidade ociosa de computação que seu negócio pode ou não precisar a qualquer momento (de forma preditiva ou não, por exemplo, numa campanha de marketing, ou em um movimento de redes sociais). E se ao além de falar de servidores, de operação de datacenter nós falarmos sobre o próprio gerenciamento da capacidade em serviços que toda essa infraestrutura possibilita? E se ao invés de distribuir as aplicações por servidores físicos, criássemos unidades lógicas de capacidade de computação?

Poderíamos inclusive criar produtos com esse recurso de gestão computacional e monetizá-los.

Essa nova perspectiva gera uma demanda por talvez o desenvolvimento de produtos de tecnologia, mas permite **transformar capacidade ociosa em negócio tornando acessível fatores qualitativos e quantitativos da tecnologia e serviços que suportam a operação**.

**💬 Uma pausa para um conceito!**

Faça um mapa mental de sobre o conceito de **Time-sharing (Tempo Compartilhado)**, alguns links que podem ajudar:

- Meio confuso, mas deve-se ler como uma composição de conceitos: https://pt.wikipedia.org/wiki/Tempo_compartilhado
- Mais bem estruturado, porém em inglês: https://en.wikipedia.org/wiki/Time-sharing

As ferramentas recomendadas são o [Whimsical](https://whimsical.com/), [mindmeister](https://www.mindmeister.com/) e [diagrams.net (antigo draw.io)](https://www.diagrams.net/). Escolha a que se sentir mais confortável para

**☁️ Voltando ao texto**

Então agora que você viu na prática uma breve demonstração da [economia de escala](https://pt.wikipedia.org/wiki/Economia_de_escala) aplicada para uma solução tecnológica, vamos pular um pouco os conceitos históricos e falar um pouco dos provedores de nuvem.

Os provedores de nuvem (ou em inglês, cloud provider) é como a empresa que te fornece internet, só que o serviço que ela te fornece são serviços e produtos para computação em nuvem. Hoje no mercado, existem várias, muitas além das que normalmente conhecemos ([aqui uma "pequena" lista](https://en.wikipedia.org/wiki/Category:Cloud_computing_providers)), mas vamos falar de 3 e nesse curso apenas de uma para reduzir o escopo. As 3 são:

- [AWS ou Amazon Web Services](https://aws.amazon.com/)
- [GCP ou Google Cloud](https://cloud.google.com/)
- [Azure ou Microsoft Azure](https://azure.microsoft.com/en-us/)

E nesse curso vamos falar especificamente da **Google Cloud**. Ao longo do curso falaremos das diferenças entre elas, do negócio de cada uma, como a marca vinculada a cada empresa impacta na comunidade que normalmente utiliza aquele provedor e muito mais.

## Um desafio para as equipes

1. Cada equipe deverá ler a página de [visão geral sobre redes no GCP](https://cloud.google.com/vpc/docs/overview);
2. A pessoa que está como guia deverá então criar uma **branch WIP** com o seguinte formato: `WIP/nome_da_equipe/session-1`;
3. Nessa branch a equipe deverá criar uma pasta `docs/` no repositório e nela um arquivo `session-1.md`;
4. Esse tipo de arquivo se chama [Markdown](https://experienceleague.adobe.com/docs/contributor/contributor-guide/writing-essentials/markdown.html?lang=pt-BR) e o trabalho da equipe deverá ser consolidado nele;
   1. Caso precise de um editor rápido de markdown, utilize: https://dillinger.io/
5. No ponto em que a equipe considera finalizado uma pessoa deverá comentar nessa issue com o nome da **branch WIP**;

**👾 Então para as perguntas do desafio:**

- **Q1.** O que é uma VPC no GCP?
- **Q2.** Quais são os componentes de uma VPC?
- **Q3.** Quais são os conceitos com um breve resumo sobre redes que devo me atentar ao pensar em uma VPC?
- **Q4.** Para o que uma VPC serve? Cite um exemplo.
- **🚀 Pergunta Bônus B1:** Quanto custa ter uma VPC no GCP?
- **🚀 Pergunta Bônus B2:** Quais são as opções para aumentar a segurança de uma VPC?
- **🚀 Pergunta Bônus B3:** O que são endereços e intervalos de IP?

Nesse arquivo estruture um conteúdo para que como uma boa documentação, objetiva e simples, responde as dúvidas acima para alguém que está aprendendo.

# Feedback da sessão

Dê uma reação com os emojis para ajudar na melhoria contínua do curso: 

- 🎉 Está incrível!
- ❤️️ Está muito legal!
- 👍 Está legal.
- 👎 Não gostei ou não consegui acompanhar.