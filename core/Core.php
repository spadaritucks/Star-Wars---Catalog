<?php

// Classe responsável por executar as rotas do sistema.
class Core{

    // Método que executa as rotas do sistema.
    public function run($routes){
        $url = '/'; // Inicializa a URL com o valor padrão.

        // Verifica se a URL foi passada via GET e a concatena à URL.
        isset($_GET['url']) ? $url .= $_GET['url'] : '';

        // Remove a barra à direita da URL se não for a raiz.
        ($url != '/') ? $url = rtrim($url, '/') : $url;

        // Percorre as rotas definidas.
        foreach($routes as $path => $controller){
            // Cria um padrão de regex para a rota, substituindo {id} por um padrão de caracteres.
            $pattern = '#^'.preg_replace('/{id}/','([\w+])', $path).'$#';
            // Verifica se a URL atual bate com o padrão de regex criado.
            if(preg_match($pattern, $url, $matches)){

                // Remove o primeiro elemento do array de matches, que é o match completo.
                array_shift($matches);
                // Divide o controller em seu nome e ação.
                [$currentController, $action] = explode('@', $controller);
                // Requer o arquivo do controller.
                require_once __DIR__."/../app/controllers/$currentController.php";
                // Cria uma nova instância do controller.
                $newController = new $currentController();
                // Chama a ação do controller, passando os parâmetros.
                $newController->$action($matches);

            }
        }

    }


}

?>