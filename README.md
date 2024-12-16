## Pokémon API - Gerenciador de Pokémons

Este projeto tem como objetivo conectar o backend com o frontend, instanciar um banco de dados atraves do docker compose, e dockerizar tudo atraves do docker compose, para que ele possa orquestrar o back, front e bd.
Anteriormente o backend puxava os dados da pokeapi e o frontend fazia a requisicao, nesse projeto eu substitui a pokeapi pelo banco de dados instanciado atraves do docker compose, contendo as informacoes dos pokemons(nome, habilidade e sprite).
Entao, comentei o arquivo que continha a pokeapi, ja que eu nao irei utilizar ela, para utilizar somente o banco de dados instanciado.

## Requisitos
Docker
Docker Compose
Ruby (para rodar localmente sem Docker)
Node.js (para rodar o frontend localmente)

## Estrutura do Projeto
A estrutura do projeto está dividida em três serviços principais, que são configurados e gerenciados utilizando o Docker Compose:

Backend: Aplicação Ruby on Rails que expõe a API de Pokémons.
Frontend: Aplicação React que consome a API do backend e exibe as informações dos Pokémons.
Banco de Dados: MySQL que armazena as informações dos Pokémons.

## Docker Compose
Utilizei o Docker Compose para orquestrar os serviços do projeto. O Docker Compose permite definir e executar múltiplos containers Docker a partir de um único arquivo de configuração (docker-compose.yml). Neste projeto, o Docker Compose é responsável por:

Subir o Banco de Dados MySQL - O container do banco de dados é iniciado com a configuração para a base de dados devopscase_development.
Subir o Backend (Ruby on Rails) - O serviço do backend é responsável pela API e se conecta ao banco de dados.
Subir o Frontend (React) - O frontend consome a API do backend e exibe os dados na interface de usuário.


## Como Usar o Docker Compose
git clone https://github.com/zecaops/case.git
cd <nome-do-repositorio>

Crie e inicie na pasta raiz os containers com o Docker Compose:

docker-compose up --build

Isso irá:

Baixar as imagens necessárias para o banco de dados e o backend.
Criar as tabelas no banco de dados e rodar as migrações.
Subir os containers para o backend (Rails) e frontend (React).

## Acessando a aplicação:

Frontend (React): A interface de usuário estará disponível em http://172.18.0.4:5173/(ou procure Network : http://172.18.0.4:5173/ no terminal quando o docker-compose estiver construindo).
 

## Estrutura do Banco de Dados
Criei o bd utilizando o docker compose
A tabela pokemons possui os seguintes campos:

id: Identificador único do Pokémon (gerado automaticamente).
name: Nome do Pokémon.
abilities: Habilidades do Pokémon.
sprite_url: URL para a imagem do Pokémon.
created_at: Data de criação do registro.
updated_at: Data de atualização do registro.

Os dados dos Pokémons são populados inicialmente com 40 registros. Esses dados podem ser consultados pela API exposta pelo backend.

## Configuração do Banco de Dados no Backend
O backend é configurado para se conectar ao banco de dados MySQL através de variáveis de ambiente definidas no arquivo docker-compose.yml:

DB_USERNAME: Nome do usuário do banco de dados.
DB_PASSWORD: Senha do banco de dados.
DB_HOST: Endereço do serviço do banco de dados (dentro do Docker Compose, ele é chamado de db).
DB_NAME: Nome do banco de dados (devopscase_development).

para acessar o backend atraves do docker compose basta digitar o comando:
docker ps (para ver o id do container)
docker exec -it (id do container(basta os 4 primeiros digitos)) bash

## Frontend (React)
O frontend foi desenvolvido em React e utiliza a biblioteca Vite para servir a aplicação. Ele se comunica com o backend exibindo os dados dos Pokémons na interface gráfica.

O frontend está disponível na URL http://172.18.0.4:5173/.

para acessar o frontend atraves do docker compose basta digitar o comando:
docker ps (para ver o id do container)
docker exec -it (id do container(basta os 4 primeiros digitos)) bash


## Como Populei o Banco de Dados
Durante o processo de configuração do banco de dados, inseri dados de 40 Pokémons.

para verificar os dados existentes no banco basta:

acessar o container do banco com o comando:
docker ps (para ver o id do container)
docker exec -it (id do container(basta os 4 primeiros digitos)) bash
para entrar no mysql:
mysql -h db -u user -ppassword devopscase_development

dentro do mysql basta digitar: 
show tables;
describes pokemons;
select * from pokemons;

caso aconteca algum erro e o banco venha vazio, aqui o comando para popular com alguns pokemons:
INSERT INTO pokemons (name, abilities, sprite_url, created_at, updated_at) VALUES
('Bulbasaur', 'Overgrow, Chlorophyll', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png', NOW(), NOW()),
('Ivysaur', 'Overgrow, Chlorophyll', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png', NOW(), NOW()),
('Venusaur', 'Overgrow, Chlorophyll', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png', NOW(), NOW());

apos isso, basta atualizar a pagina do front no navegador e fazer o teste com algum desses pokemons.



## Conclusão
Essa foi minha primeira experiencia com docker, ruby e ubuntu(utilizei ubuntu para facilitar minha vida, pois percebi que pelo windows seria um pouco complexo) confesso que no comeco demorei para entender, procurei em sites, videos no youtube e ajuda do chatgpt. Foi bastante desafiador a criacao de um banco de dados atraves do docker compose, e ainda orquestrar o back, front e banco, atraves do docker compose. O docker e uma ferramenta sensacional, nunca tinha visto algo parecido na faculdade, com certeza irei utilizar em projetos futuros.
