# CG Insights

Esse repositório foi criado com o objetivo de analisar as ementas que tramitaram na [Câmara Municipal de Campina Grande](https://www.campinagrande.pb.leg.br/) no período de 2009 à 2016 e assim podermos divulgar achados e insights dessas análises. Assim os cidadãos campinenses poderão conhecer melhor os candidatos contribuindo para um voto mais consciente. 
A base de dados foi extraída do [Sistema de Busca de Documentos](http://187.115.174.90:8080/ScanLexWeb/) utilizado pela Câmara para armazenar e disponibilizar as ementas. 

Vamos fazer uma Campina melhor! Aproveitemos as eleições!

## Base de Dados
A base é composta pela tabela principal **ementas**, tabelas auxiliares geradas à mão (i.e. *comissoes_tecnicas*, *mesa_diretora*) como também extraídas do Repositório de dados eleitorais no site do [Tribunal Superior Eleitoral](http://www.tse.jus.br/eleicoes/estatisticas/repositorio-de-dados-eleitorais). Abaixo mostramos as tabelas e como elas são definidas, a principio não forçamos relações (i.e. chave estrangeira) mas elas podem ser realizadas por meio das colunas com ids. Caso deseje ter acesso basta enviar um email para augustoqmacedo@gmail.com.

![Camara Data Model](docs/camara_data_model.png)

## Aviso
Esse repositório e todo o seu conteúdo não tem nenhuma intenção muito menos relação com quaisquer candidato a eleição ou pessoa pública na atualidade. 
