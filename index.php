<?php

//Arquivo de rotas do sistema.
require_once __DIR__."/routes/routes.php";
//Arquivo da configuração das Rotas(Core).
require_once __DIR__."/core/Core.php";

echo 'teste';

// Registra uma função de autoload para carregar automaticamente classes.
spl_autoload_register(function($file) {
    // Verifica se o arquivo existe na pasta de configurações.
    if (file_exists(__DIR__."/app/config/$file.php")) {
        require_once __DIR__."/app/config/$file.php";
    }
    // Se não existir na pasta de configurações, verifica na pasta de modelos.
    else if (file_exists(__DIR__."/app/models/$file.php")) {
        require_once __DIR__."/app/models/$file.php";
    }
});

// Cria uma nova instância da classe Core.
$core = new Core();

// Executa o método run da classe Core, passando as rotas como parâmetro.
$core->run($routes);