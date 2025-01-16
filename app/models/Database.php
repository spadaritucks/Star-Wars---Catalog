<?php

// Classe Database responsável por gerenciar a conexão com o banco de dados
class Database{

    // Método para estabelecer uma conexão com o banco de dados
    public function getConnection(){
        try{
            // Tenta criar uma conexão PDO com o banco de dados
            $pdo = new PDO('mysql:host=localhost;dbname=star-wars-teste-l5-networks', 'root', 'titi9632');
            // Retorna a conexão criada
            return $pdo;
        }catch(PDOException $e){
            // Se houver um erro ao tentar criar a conexão, exibe a mensagem de erro
            echo $e->getMessage();
        }
    }

}