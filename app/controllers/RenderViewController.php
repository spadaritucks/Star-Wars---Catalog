<?php

// Classe responsável por controlar as ações relacionadas à renderização das visualizações
class RenderViewController extends RenderView
{

    // Método para exibir a página inicial
    public function Home()
    {

        $this->loadView('home', [
            'title' => 'Star Wars Catalog',
        ]);
    }

    // Método para exibir a página de informações do filme
    public function InformationFilm()
    {
        $this->loadView('information_film', [
            'title' => 'Star Wars Catalog',
        ]);
    }
}
