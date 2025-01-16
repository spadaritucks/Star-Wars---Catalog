<?php

// Classe Characters que estende a classe Database
class Characters extends Database
{
    // Atributo privado para armazenar a conexão PDO
    private $pdo;

    // Construtor da classe que inicializa a conexão PDO
    public function __construct()
    {
        $this->pdo = $this->getConnection();
    }

    // Método para obter todos os personagens
    public function GetAllCharacters()
    {
        // Prepara e executa uma consulta SQL para obter todos os personagens
        $stmt = $this->pdo->query("SELECT * FROM characters");
        // Verifica se a consulta retornou resultados
        if ($stmt->rowCount() > 0) {
            // Retorna todos os personagens como um array associativo
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } else {
            // Retorna um array vazio se não houver personagens
            return [];
        }
    }

    // Método para criar um novo personagem
    public function CreateCharacters($name, $height, $mass, $hair_color, $skin_color, $eye_color, $birth_year, $gender, $homeworld_id, $created_at)
    {
        try {
            // Prepara uma consulta SQL para inserir um novo personagem
            $stmt = $this->pdo->prepare("INSERT INTO characters (name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, homeworld_id, created_at) 
            VALUES (:name, :height, :mass, :hair_color, :skin_color, :eye_color, :birth_year, :gender, :homeworld_id, :created_at)");
            // Associa os parâmetros à consulta preparada
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':height', $height);
            $stmt->bindParam(':mass', $mass);
            $stmt->bindParam(':hair_color', $hair_color);
            $stmt->bindParam(':skin_color', $skin_color);
            $stmt->bindParam(':eye_color', $eye_color);
            $stmt->bindParam(':birth_year', $birth_year);
            $stmt->bindParam(':gender', $gender);
            $stmt->bindParam(':homeworld_id', $homeworld_id);
            $stmt->bindParam(':created_at', $created_at);
            // Executa a consulta
            $stmt->execute();

            // Retorna uma mensagem de sucesso
            return [
                "status" => 201,
                "message" => "Personagem criado com sucesso",
            ];

        } catch (PDOException $e) {
            // Retorna uma mensagem de erro em caso de exceção
            return[
                "status" => 400,
                "message" => "Erro: " .$e->getMessage(),
            ];
        }
    }
}
