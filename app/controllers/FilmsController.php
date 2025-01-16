<?php

require_once('app/models/Films.php'); //Importação da Model de Films
require_once('app/models/Films_Characters.php'); //Importação da Model de Films_Characters (Tabela Pivo entre Filmes e Personagens)

class FilmsController
{
    //Consultar a tabela filmes
    public function index()
    {
        try {
            $films = new Films(); // Cria uma nova instância do modelo de filmes

            $resultFilms = $films->GetAllFilms(); // Obtém todos os filmes

            header('Content-Type: application/json'); // Define o tipo de conteúdo como JSON

            echo json_encode($resultFilms); // Retorna os dados como JSON

        } catch (PDOException $e) {
            echo json_encode(['error' => 'Erro: ' . $e->getMessage()]); // Retorna erro como JSON
        }
    }

    //Consultar Dados da Tabela Pivo de Filmes e Personagens
    public function indexFilmsCharacters()
    {
        try {
            $filmsCharacters = new Films_Characters(); // Cria uma nova instância do modelo de filmes e personagens
            $resultFilms_Characters = $filmsCharacters->getAllFilms_Characters(); // Obtém todos os relacionamentos entre filmes e personagens
            header('Content-Type: application/json'); // Define o tipo de conteúdo como JSON
            echo json_encode($resultFilms_Characters); // Retorna os dados como JSON

        } catch (PDOException $e) {
            echo json_encode(['error' => 'Erro: ' . $e->getMessage()]); // Retorna erro como JSON
        }
    }

    //Logica para adicionar filmes no banco de dados vinculado ao relacionamento com os Personagens
    public function store()
    {
        $apiUrl = 'https://swapi-node.vercel.app/api/films'; // URL da API do Star Wars para filmes
        $films_imagens = [
            4 => 'public/starwars-episode IV - 4.jpg',
            5 => 'public/starwars-episode V - 5.jpg',
            6 => 'public/starwars-episode VI - 6.jpg',
            1 => 'public/starwars-episode l - 1.jpg',
            2 => 'public/starwars-episode 2- 2.jpg',
            3 => 'public/starwars-episode 3- 3.jpg',
            7 => 'public/starwars-episode VII - 7.jpg',
            8 => 'public/starwars-episode VIII - 8..png',
            9 => 'public/starwars-episode IX - 9..png',
        ]; // Array de imagens para os filmes

        // Requisição para a API do Star Wars
        $curl = curl_init($apiUrl); // Inicia a sessão cURL
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); // Retorna a transferência como uma string
        curl_setopt($curl, CURLOPT_HTTPGET, true); // Define a solicitação como GET

        $apiResponse = curl_exec($curl); // Executa a solicitação
        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE); // Obtém o código HTTP da resposta

        if ($httpCode !== 200) { // Verifica se a solicitação foi bem-sucedida
            echo "Erro ao acessar a API. Código HTTP: $httpCode"; // Retorna erro se o código HTTP não for 200
            curl_close($curl); // Fecha a sessão cURL
            return; // Sai da função
        }

        curl_close($curl); // Fecha a sessão cURL

        // Inserção no banco de dados
        try {
            $films = json_decode($apiResponse, true)['results']; // Decodifica a resposta JSON e obtém os resultados

            if (is_array($films) && !empty($films)) { // Verifica se existem filmes na resposta
                $FilmsModel = new Films(); // Cria uma nova instância do modelo de filmes

                foreach ($films as $film) { // Itera sobre cada filme
                    $fields = $film['fields']; // Obtém os campos do filme
                    $episode_id = $fields['episode_id']; // Obtém o episódio do filme

                    // Pega a imagem correspondente ao episódio
                    $image_film = $films_imagens[$episode_id] ?? 'default.jpg'; // Se não encontrar, usa uma imagem padrão
                    // Data e hora atuais
                    $created_at = date('Y-m-d H:i:s'); // Obtém a data e hora atuais

                    //Idade do Filme
                    $currentDate = new DateTime(date('Y-m-d H:i:s')); // Data e hora atuais
                    $releaseDate = new DateTime($fields['release_date']); // Data de lançamento do filme
                    $interval = $currentDate->diff($releaseDate); // Calcula a diferença entre as datas
                    // Calcula a idade total
                    $film_age = "{$interval->y} years, {$interval->m} months and {$interval->d} days"; // Para exibição, se necessário

                    //Relacionamento entre Personagens e Filmes
                    $characterIds = $fields['characters']; // Obtém os IDs dos personagens

                    // Insere os dados no banco
                    $result = $FilmsModel->CreateFilms(
                        $image_film,
                        $fields['title'],
                        $episode_id,
                        $fields['opening_crawl'],
                        $fields['director'],
                        $fields['producer'],
                        $fields['release_date'],
                        $film_age,
                        $created_at,
                        $characterIds
                    );
                }

                // Retorna a mensagem de resultado
                echo $result['message'];
            } else {
                echo "Nenhum filme encontrado na resposta da API.";
            }
        } catch (PDOException $e) {
            echo "Erro ao criar os filmes: " . $e->getMessage(); // Retorna erro ao criar os filmes
        }
    }
}
