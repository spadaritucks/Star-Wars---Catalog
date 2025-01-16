<?php

// Classe Films que estende a classe Database para gerenciar filmes
class Films extends Database
{


    private $pdo; // Atributo privado para armazenar a conexão PDO

    // Construtor da classe que inicializa a conexão PDO
    public function __construct()
    {
        $this->pdo = $this->getConnection(); // Chama o método getConnection para estabelecer a conexão
    }

    // Método para obter todos os filmes
    public function GetAllFilms()
    {
        $stmt = $this->pdo->query("SELECT * FROM films"); // Prepara e executa uma consulta SQL para obter todos os filmes
        if ($stmt->rowCount() > 0) { // Verifica se a consulta retornou resultados
            return $stmt->fetchAll(PDO::FETCH_ASSOC); // Retorna todos os filmes como um array associativo
        } else {
            return []; // Retorna um array vazio se não houver filmes
        }
        return array(); // Retorna um array vazio como valor padrão
    }
    

    //Função para inserir filmes na tabela films
    public function CreateFilms($image_film, $title, $episode_id, $opening_crawl, $director, $producer, $release_date, $film_age, $created_at, $characterUrls)
    {
        try {
            $stmt = $this->pdo->prepare("INSERT INTO films (image_film, title, episode_id, opening_crawl, director, producer, release_date, film_age, created_at) 
            VALUES (:image_film, :title, :episode_id, :opening_crawl, :director, :producer, :release_date, :film_age, :created_at)");

            $stmt->bindParam(':image_film', $image_film); // Associa o parâmetro :image_film à variável $image_film
            $stmt->bindParam(":title", $title); // Associa o parâmetro :title à variável $title
            $stmt->bindParam(":episode_id", $episode_id); // Associa o parâmetro :episode_id à variável $episode_id
            $stmt->bindParam(":opening_crawl", $opening_crawl); // Associa o parâmetro :opening_crawl à variável $opening_crawl
            $stmt->bindParam(":director", $director); // Associa o parâmetro :director à variável $director
            $stmt->bindParam(":producer", $producer); // Associa o parâmetro :producer à variável $producer
            $stmt->bindParam(":release_date", $release_date); // Associa o parâmetro :release_date à variável $release_date
            $stmt->bindParam(":film_age", $film_age); // Associa o parâmetro :film_age à variável $film_age
            $stmt->bindParam(":created_at", $created_at); // Associa o parâmetro :created_at à variável $created_at

            $stmt->execute(); // Executa a consulta preparada

            $filmId = $this->pdo->lastInsertId(); // Obtém o ID do filme inserido

            //Logica de Relacionamento entre a Tabela Filmes e Personagens
            $filmsCharactersModel = new Films_Characters(); // Cria uma nova instância do modelo Films_Characters

            foreach ($characterUrls as $characterUrl) { // Itera sobre as URLs dos personagens
                $characterId = explode('/', $characterUrl)[3]; // Extrai o ID do personagem da URL
                $filmsCharactersModel->CreateFilms_Characters($characterId, $filmId); // Chama o método CreateFilms_Characters para criar o relacionamento
            }

            return [
                "status" => 201, // Retorna o status de sucesso
                'id' => $filmId, // Retorna o ID do filme criado
                'message' => 'Film created successfully', // Retorna a mensagem de sucesso

            ];

        } catch (PDOException $e) { // Captura uma exceção PDO
            return [
                "status" => 401, // Retorna o status de erro
                "message" => "Error: " . $e->getMessage(), // Retorna a mensagem de erro
            ];
        }
    }
}
