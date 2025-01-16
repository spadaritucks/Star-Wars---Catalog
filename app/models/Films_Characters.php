<?php

require_once('app/models/Films_Characters.php');

// Classe Films_Characters que estende a classe Database para gerenciar relacionamentos entre filmes e personagens
class Films_Characters extends Database

{
    // Atributo privado para armazenar a conexão PDO
    private $pdo;

    // Construtor da classe que inicializa a conexão PDO
    public function __construct()
    {
        $this->pdo = $this->getConnection();
    }

    // Método para obter todos os relacionamentos entre filmes e personagens
    public function getAllFilms_Characters()
    {
        // Prepara e executa uma consulta SQL para obter todos os relacionamentos
        $stmt = $this->pdo->query("SELECT * FROM character_film");
        // Verifica se a consulta retornou resultados
        if ($stmt->rowCount() > 0) {
            // Retorna todos os relacionamentos como um array associativo
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } else {
            // Retorna um array vazio se não houver relacionamentos
            return [];
        }
    }

    // Método para criar um novo relacionamento entre um filme e um personagem
    public function CreateFilms_Characters($character_id, $film_id)
    {
        try {
            // Prepara uma consulta SQL para inserir um novo relacionamento
            $stmt = $this->pdo->prepare("INSERT INTO character_film (character_id,film_id) VALUES (:character_id, :film_id)");
            // Associa os parâmetros à consulta preparada
            $stmt->bindParam(':character_id', $character_id);
            $stmt->bindParam(':film_id', $film_id);
            // Executa a consulta
            $stmt->execute();
            
            //Return se encontra na  model de filmes

        } catch (PDOException $e) {
            // Exibe uma mensagem de erro se houver um problema ao criar o relacionamento
            echo "Erro no relacionamento: " . $e->getMessage();
            return 0; // Retorna 0 em caso de erro
        }
    }
}
