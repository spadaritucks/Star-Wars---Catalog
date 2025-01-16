<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Importação dos Estilos do Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!--Importação da estilização global  -->
    <link rel="stylesheet" href='resources/css/globals.css' type="text/css" />
    <!-- Importação do arquivo CSS Principal da Pagina -->
    <link rel="stylesheet" href='resources/css/information_film.css' type="text/css" />
     <!-- Importação da estilização padrão dos botões -->
    <link rel="stylesheet" href="resources/css/button.css">
    <!-- Estilização customizada para a Janela Modal do Bootstrap -->
    <link rel="stylesheet" href="resources/css/modal.css">
    <title><?php echo $title; ?></title>
</head>

<!-- Importação da Navbar -->
<header> 
    <?php require('app/views/components/navbar.html') ?>
</header>

<body>
    <!-- Importação da Janela Modal -->
    <?php require('app/views/components/modal.html') ?>


    <!-- Section Responsavel por Exibir as Informações do Filme -->
    <section class="film-section">
        <!-- Os dados são inseridos pelo Javascript em information_film.js -->
    </section>

    <section class="opening-crawl-section">
        <h1>Opening Crawl</h1>
         <!-- Os dados são inseridos pelo Javascript em information_film.js -->
    </section>

    <section class="characters-section">
        <h1>Characters</h1>
        <div class="characters-container-grid">
             <!-- Os dados são inseridos pelo Javascript em information_film.js -->
        </div>

    </section>

</body>
 <!-- Importação do Arquivo Principal JS -->
<script src="resources/js/information_film.js"></script>

 <!-- Importação do Bootstrap e JQuery -->
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</html>