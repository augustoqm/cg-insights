## Base de Dados
A base de dados é composta pela tabela principal **ementas** (primeira do topo) e também por tabelas auxiliares geradas à mão (i.e. *comissoes_tecnicas*, *mesa_diretora*) e tabelas extraídas do Repositório de dados eleitorais no site do [Tribunal Superior Eleitoral (TSE)](http://www.tse.jus.br/eleicoes/estatisticas/repositorio-de-dados-eleitorais). Abaixo mostramos as tabelas e como elas são definidas, a principio não forçamos relações (i.e. chave estrangeira) mas elas podem ser criadas por meio das colunas com ids. 

![Camara Data Model](camara_data_model.svg)

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
As tabelas do TSE tem suas próprias descrições disponibilizadas pelo Repositório e também acessíveis aqui: [TSE_Leiame_2016.pdf](TSE_Leiame_2016.pdf) 
