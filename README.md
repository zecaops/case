## Pokémon API - Gerenciador de Pokémons
Este projeto tem como objetivo integrar o backend com o frontend, orquestrando os serviços (backend, frontend e banco de dados) utilizando o Docker Compose. Inicialmente, o backend consumia dados da PokeAPI, mas, neste projeto, substituí a API externa por um banco de dados MySQL, configurado e instanciado através do Docker Compose, que armazena as informações dos Pokémons (nome, habilidades e sprite).

## Requisitos
Antes de começar, você precisará dos seguintes requisitos:

Docker
Docker Compose
Ruby (para rodar o backend localmente sem Docker)
Node.js (para rodar o frontend localmente)

## Estrutura do Projeto
O projeto é composto por três serviços principais, todos configurados e orquestrados usando Docker Compose:

## Backend (Ruby on Rails): Exposição da API de Pokémons.
## Frontend (React): Consome a API do backend e exibe as informações dos Pokémons na interface gráfica.
## Banco de Dados (MySQL): Armazena as informações dos Pokémons.
## Além disso, vale ressaltar que foi criado um Dockerfile nas pastas devopscaseback (para o backend) e devopscasefront (para o frontend). O papel desses arquivos Dockerfile é criar as imagens que serão utilizadas pelo Docker Compose para rodar o backend e o frontend dentro de containers.

## Docker Compose
Utilizei o Docker Compose para orquestrar os serviços do projeto. Ele permite a definição e execução de múltiplos containers Docker a partir de um único arquivo de configuração (docker-compose.yml). Neste projeto, o Docker Compose faz o seguinte:

## Subir o Banco de Dados MySQL: O container do banco de dados é iniciado com a base de dados devopscase_development.
## Subir o Backend (Ruby on Rails): O backend conecta-se ao banco de dados e expõe a API de Pokémons.
## Subir o Frontend (React): O frontend consome a API do backend e exibe as informações dos Pokémons.

## Como Usar o Docker Compose
Clone o repositório:

git clone https://github.com/zecaops/case.git
cd <nome-do-repositorio>

## Crie e inicie os containers com Docker Compose:
docker-compose up --build
Isso irá:

## Baixar as imagens necessárias para o banco de dados e o backend.
## Criar as tabelas no banco de dados e rodar as migrações.
## Subir os containers para o backend (Rails) e frontend (React).

## Acessando a Aplicação
## Frontend (React): A interface de usuário estará disponível em http://172.18.0.4:5173/. Você pode também procurar a URL no terminal, que será exibida quando o Docker Compose estiver construindo os containers.

## Estrutura do Banco de Dados
A tabela pokemons foi criada no banco de dados com os seguintes campos:

## id: Identificador único do Pokémon (gerado automaticamente).
## name: Nome do Pokémon.
## abilities: Habilidades do Pokémon.
## sprite_url: URL para a imagem do Pokémon.
## created_at: Data de criação do registro.
## updated_at: Data de atualização do registro.
## O banco de dados é inicializado com 40 registros de Pokémons. Esses dados podem ser acessados através da API exposta pelo backend.

## Configuração do Banco de Dados no Backend
O backend está configurado para se conectar ao banco de dados MySQL através de variáveis de ambiente definidas no arquivo docker-compose.yml:

## DB_USERNAME: Nome do usuário do banco de dados.
## DB_PASSWORD: Senha do banco de dados.
## DB_HOST: Endereço do serviço do banco de dados (dentro do Docker Compose, é chamado de db).
## DB_NAME: Nome do banco de dados (devopscase_development).
## Para acessar o backend dentro do Docker:
Execute o comando docker ps para ver o ID do container.
Acesse o container do backend com o comando:
docker exec -it <ID-do-container> bash
## Frontend (React)
O frontend foi desenvolvido em React e utiliza a biblioteca Vite para servir a aplicação. Ele consome os dados da API do backend e os exibe na interface gráfica.

Para acessar o frontend dentro do Docker:
Execute o comando docker ps para ver o ID do container.
Acesse o container do frontend com o comando:
docker exec -it <ID-do-container> bash
O frontend estará disponível em http://172.18.0.4:5173/.

## Como Populei o Banco de Dados
Durante a configuração do banco de dados, inseri dados de 40 Pokémons na tabela pokemons. Para verificar os dados existentes:

Acesse o container do banco de dados:

docker ps
docker exec -it <ID-do-container> bash
Entre no MySQL:
mysql -h db -u user -ppassword devopscase_development
Dentro do MySQL, use os seguintes comandos:
SHOW TABLES;
DESCRIBE pokemons;
SELECT * FROM pokemons;
Se o banco de dados estiver vazio, insira dados de exemplo com o seguinte comando:
INSERT INTO pokemons (name, abilities, sprite_url, created_at, updated_at) VALUES
('Bulbasaur', 'Overgrow, Chlorophyll', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png', NOW(), NOW()),
('Ivysaur', 'Overgrow, Chlorophyll', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png', NOW(), NOW()),
('Venusaur', 'Overgrow, Chlorophyll', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png', NOW(), NOW());

Após inserir os dados, atualize a página do frontend para ver os Pokémons.

## Conclusão
Este projeto foi uma excelente oportunidade para aprender sobre Docker, Ruby on Rails e Ubuntu. Criar e orquestrar um banco de dados com Docker Compose foi desafiador, mas extremamente gratificante. O Docker é uma ferramenta poderosa e versátil, e com certeza irei utilizá-la em projetos futuros.
