# CG Insights Data

Com o objetivo de averiguarmos a situação política da Câmara Municipal de Campina Grande e assim exercermos mais diretamente nosso papel de cidadãos, lançamos mão da [Legislação sobre a Transparência Pública](http://www.portaldatransparencia.gov.br/sobre/Legislacao.asp) e coletamos o histórico de ementas publicadas no site da [Câmara Municipal de Campina Grande](https://www.campinagrande.pb.leg.br/) durante os anos de 2009 e 2016, mais especificamente no [Sistema de Busca de Documentos](http://187.115.174.90:8080/ScanLexWeb/).

Assim fortalecemos o valioso esforço da população brasileira em conhecer mais e melhor o que e como trabalham os seus representantes no governo do país.

## Base de Dados
A base de dados é composta pela tabela principal **ementas** (primeira do topo) e também por tabelas auxiliares geradas à mão (i.e. *comissoes_tecnicas*, *mesa_diretora*) e tabelas extraídas do Repositório de dados eleitorais no site do [Tribunal Superior Eleitoral (TSE)](http://www.tse.jus.br/eleicoes/estatisticas/repositorio-de-dados-eleitorais). Abaixo mostramos as tabelas e como elas são definidas, a principio não forçamos relações (i.e. chave estrangeira) mas elas podem ser criadas por meio das colunas com ids. 

![Camara Data Model](camara_data_model.png)

Os dados foram armazenados em um Banco de dados Postgresql e estão disponíveis para download aqui: [Dump Camara DB (dados até 12-08-2016)](dump_camara_db_12-08-16.zip).

### Descrição das tabelas

#### Ementas
As ementas são coletadas de uma página como essa:

![Exemplo de Ementa](ementa_exemplo.png)

A imagem mostra todos os campos disponíveis de uma ementa no Sistema de Busca de Documentos, na maioria dos casos elas não tem imagem (i.e. has_image). Toda ementa é adicionada no sistema (i.e. sys_enter_date) e é diferencida por ids do sistema (i.e. document_number e process_number). Cada uma tem os seguintes campos: uma data de publicação (i.e. published_date), um  tipo específico (i.e. ementa_type), um tema principal (i.e. main_theme), um título (i.e. title), os proponentes (i.e. proponents), uma fonte (i.e. source) que diz de onde vem os proponentes (LEGISLATIVO ou EXECUTIVO), uma situação (i.e. situation) que inicia EM TRAMITAÇÃO até ser APROVADA (i.e. approval_date) ou não. Por fim, o horário da coleta de cada ementa é armazenado no insert_time.

Mais abaixo na seção *Como Funciona?** damos mais detalhes do processo de submissão, discussão e aprovação de ementas, também conhecidas como proposições.

#### Tabelas auxiliares
A tabela **comissoes_tecnicas** lista as comissões técnicas formadas na câmara para lidar com questões específicas. Ela possui também o ano da eleição, o nome do candidato e seu id permitindo o relacionamento com as demais tabelas. Fizemos o mesmo com a tabela **mesa_diretora**, montamos a mão a lista da mesa diretora para facilitar futuras análises.

#### Tabelas do TSE
As tabelas do TSE contém os dados eleitorais públicos, da Paraíba apenas, para os anos 2008, 2012 e 2016. A tabela perfil_eleitor_secao foi filtrada ainda mais para CAMPINA GRANDE apenas, devido as suas proporções.

Os campos e suas descrições estão disponíveis no próprio Repositório e também acessíveis aqui: [TSE_Leiame_2016.pdf](TSE_Leiame_2016.pdf) e [TSE_Leiame_2016-Perfil_Eleitor_Secao.pdf](TSE_Leiame_2016-Perfil_Eleitor_Secao.pdf).

## Aviso
Esse repositório e todo o seu conteúdo não tem intenção política muito menos relação com quaisquer candidato a eleição ou pessoa pública.
