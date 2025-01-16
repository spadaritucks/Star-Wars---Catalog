<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!--Importação da estilização global  -->
    <link rel="stylesheet" href='resources/css/globals.css' type="text/css" />
     <!-- Importação do arquivo CSS Principal da Pagina -->
    <link rel="stylesheet" href='resources/css/home.css' type="text/css" />

    <title><?php echo $title; ?></title>
</head>

<body>
    <header>
           <!-- Importação da Navbar -->
        <?php require('app/views/components/navbar.html') ?>
    </header>

    <!-- Section responsavel por armazenar os filmes -->
    <section class="films-grid-container">
        <!-- Os dados são inseridos pelo Javascript em home.js -->
    </section>


</body>
<!-- Importação do Arquivo Principal JS -->
<script src="resources/js/home.js"></script>

</html>