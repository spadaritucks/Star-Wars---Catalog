<?php

// Requer o modelo de personagens
require('app/models/Characters.php');


// Classe responsável por controlar as ações relacionadas aos personagens
class CharactersController
{

    // Método para exibir todos os personagens
    public function index()
    {
        try {
            // Cria uma nova instância do modelo de personagens
            $characters = new Characters();
            // Obtém todos os personagens
            $resultCharacters = $characters->GetAllCharacters();
            // Define o tipo de conteúdo como JSON
            header('Content-Type: application/json');
            // Retorna os dados como JSON
            echo json_encode($resultCharacters);
        } catch (PDOException $e) {
            // Retorna erro como JSON em caso de exceção
            echo json_encode(['error' => 'Erro: ' . $e->getMessage()]);
        }
    }

    // Método para inserir novos personagens
    public function store()
    {
        // URL da API do Star Wars
        $apiUrl = 'https://swapi-node.vercel.app/api/people';
        // Cria uma nova instância do modelo de personagens
        $CharactersModel = new Characters();

        try {

            while ($apiUrl) {

                // Inicia a requisição para a API do Star Wars
                $curl = curl_init($apiUrl);
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($curl, CURLOPT_HTTPGET, true);

                // Executa a requisição
                $apiResponse = curl_exec($curl);
                $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);

                // Verifica se a requisição foi bem-sucedida
                if ($httpCode !== 200) {
                    echo "Erro ao acessar a API. Código HTTP: $httpCode";
                    curl_close($curl);
                    return;
                }

                curl_close($curl);

                // Decodifica a resposta da API
                $apiDecoded = json_decode($apiResponse, true);

                // Obtém os personagens da resposta
                $characters = $apiDecoded['results'];



                // Verifica se existem personagens na resposta
                if (is_array($characters) && !empty($characters)) {


                    foreach ($characters as $character) {
                        $fields = $character['fields'];

                        $homeworldURL = $fields['homeworld'];

                        //Extrair o Id da URL do JSON - Id do Planeta
                        $homeworldId = explode('/', $homeworldURL)[3];

                        // Data e hora atuais
                        $created_at = date('Y-m-d H:i:s');

                        // Insere os dados no banco
                        $result = $CharactersModel->CreateCharacters(
                            $fields['name'],
                            $fields['height'],
                            $fields['mass'],
                            $fields['hair_color'],
                            $fields['skin_color'],
                            $fields['eye_color'],
                            $fields['birth_year'],
                            $fields['gender'],
                            $homeworldId,
                            $created_at

                        );
                    }

                    // Verifica se existe uma próxima página na resposta da API
                    $apiUrl = isset($apiDecoded['next']) ?
                        (strpos($apiDecoded['next'], 'http') === 0 ? $apiDecoded['next'] : 'https://swapi-node.vercel.app' . $apiDecoded['next'])
                        : null;
                } else {
                    echo "Nenhum personagem, encontrado na resposta da API.";
                }
            }
            // Retorna a mensagem de resultado
            echo $result['message'];
            
        } catch (PDOException $e) {
            // Retorna erro como JSON em caso de exceção
            echo json_encode(['error' => 'Erro: ' . $e->getMessage()]);
        }
    }
}
