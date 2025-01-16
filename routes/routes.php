<?php


$routes = [

    //Rotas para renderizar o front-end
    '/' => 'RenderViewController@Home',
    '/information_film' => 'RenderViewController@InformationFilm',

    //Rotas/Endpoint para efetuar requisições para a API de Star Wars

    //Planetas
    '/planets' => 'PlanetsController@index', //Listar todos os planetas
    '/create_planets' => 'PlanetsController@store', //Criar um novo planeta

    //Personagens
    '/characters' => 'CharactersController@index', //Listar todos os personagens
    '/create_characters' => 'CharactersController@store', //Criar um novo personagem

    //Filmes
    '/films' => 'FilmsController@index', //Listar todos os filmes
    '/create_films' => 'FilmsController@store', //Criar um novo filme

    //Consultar Filmes e Personagens
    '/films_characters' => 'FilmsController@indexFilmsCharacters', //Listar todos os filmes e personagens




];
