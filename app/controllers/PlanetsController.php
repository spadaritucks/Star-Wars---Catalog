<?php

require('app/models/Planets.php'); // Requer o modelo de planetas

class PlanetsController
{
    // Método para exibir todos os planetas
    public function index()
    {
        try {
            $planets = new Planets(); // Cria uma nova instância do modelo de planetas
            $resultPlanets = $planets->GetAllPlanets(); // Obtém todos os planetas
            header('Content-Type: application/json'); // Define o tipo de conteúdo como JSON
            echo json_encode($resultPlanets); // Retorna os dados como JSON
        } catch (PDOException $e) {
            echo json_encode(['error' => 'Erro: ' . $e->getMessage()]); // Retorna erro como JSON
        }
    }

    // Método para inserir novos planetas
    public function store()
    {
        $apiUrl = 'https://swapi-node.vercel.app/api/planets'; // URL da API do Star Wars para planetas
        $PlanetsModel = new Planets(); // Cria uma nova instância do modelo de planetas

        try {
            while ($apiUrl) { // Enquanto houver uma URL para a API

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

                $apiDecoded = json_decode($apiResponse, true); // Decodifica a resposta JSON

                $planets = $apiDecoded['results']; // Obtém os planetas da resposta

                if (is_array($planets) && !empty($planets)) { // Verifica se existem planetas na resposta
                    foreach ($planets as $planet) {
                        $fields = $planet['fields']; // Obtém os campos do planeta

                        $created_at = date('Y-m-d H:i:s'); // Data e hora atuais

                        // Insere os dados no banco
                        $result = $PlanetsModel->CreatePlanets(
                            $fields['name'],
                            $fields['rotation_period'],
                            $fields['orbital_period'],
                            $fields['diameter'],
                            $fields['climate'],
                            $fields['gravity'],
                            $fields['terrain'],
                            $fields['surface_water'],
                            $fields['population'],
                            $created_at,
                        );
                    }

                    $apiUrl = isset($apiDecoded['next']) ? // Verifica se há uma próxima página
                        (strpos($apiDecoded['next'], 'http') === 0 ? $apiDecoded['next'] : 'https://swapi-node.vercel.app' . $apiDecoded['next'])
                        : null; // Atualiza a URL para a próxima página ou a define como nula se não houver mais páginas
                } else {
                    echo "Nenhum planeta encontrado na resposta da API."; // Retorna mensagem se não houver planetas na resposta
                }
            }
            // Retorna a mensagem de resultado
            echo $result['message'];
            
        } catch (PDOException $e) {
            echo json_encode(['error' => 'Erro: ' . $e->getMessage()]); // Retorna erro como JSON
        }
    }
}
