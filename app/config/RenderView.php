<?php


 // Classe responsável por renderizar as views do sistema.
class RenderView
{
   
    public function loadView($view, $args)
    {
        // Extrai os argumentos fornecidos para que sejam utilizados na view.
        extract($args); 
        // Requer o arquivo da view especificada, utilizando o caminho relativo.
        require_once __DIR__ . "/../views/pages/$view.php";
    }
}

?>