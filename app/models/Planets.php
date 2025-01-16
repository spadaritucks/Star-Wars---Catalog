<?php

// Classe Planets que estende a classe Database para gerenciar planetas
class Planets extends Database
{
    // Atributo privado para armazenar a conexão PDO
    private $pdo;

    // Construtor da classe que inicializa a conexão PDO
    public function __construct()
    {
        $this->pdo = $this->getConnection();
    }

    // Método para obter todos os planetas
    public function GetAllPlanets()
    {
        // Prepara e executa uma consulta SQL para obter todos os planetas
        $stmt = $this->pdo->query("SELECT * FROM planets ");
        // Verifica se a consulta retornou resultados
        if ($stmt->rowCount() > 0) {
            // Retorna todos os planetas como um array associativo
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } else {
            // Retorna um array vazio se não houver planetas
            return [];
        }
        
    }

    // Método para criar um novo planeta
    public function CreatePlanets($name, $rotation_period, $orbital_period, $diameter, $climate, $gravity, $terrain, $surface_water, $population, $created_at)
    {
        try {
            // Prepara uma consulta SQL para inserir um novo planeta
            $stmt = $this->pdo->prepare("INSERT INTO planets (name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population, created_at) 
            VALUES (:name, :rotation_period,:orbital_period, :diameter, :climate, :gravity, :terrain, :population, :surface_water, :created_at)");
            // Associa os parâmetros à consulta preparada
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':rotation_period', $rotation_period);
            $stmt->bindParam(':orbital_period', $orbital_period);
            $stmt->bindParam(':diameter', $diameter);
            $stmt->bindParam(':climate', $climate);
            $stmt->bindParam(':gravity', $gravity);
            $stmt->bindParam(':terrain', $terrain);
            $stmt->bindParam(':surface_water', $surface_water);
            $stmt->bindParam(':population', $population);
            $stmt->bindParam(':created_at', $created_at);

            // Executa a consulta
            $stmt->execute();

            // Retorna uma mensagem de sucesso
            return [
                "status" => 201,
                "message" => "Planet created successfully",
            ];
            
        } catch (PDOException $e) {
            // Exibe uma mensagem de erro se houver um problema ao criar o planeta
            return [
                "status" => 400,
                "message" => "Error: " . $e->getMessage(),
            ];
        }
    }
}
