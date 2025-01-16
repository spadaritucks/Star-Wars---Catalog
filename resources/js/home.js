// Função responsável por chamar a API de Filmes
function fetchFilms() {
    // Realiza uma solicitação HTTP GET para a API de filmes
    fetch('http://localhost/star-wars-teste-l5-networks/films')
        .then(response => {
            // Verifica se a resposta foi bem-sucedida
            if (!response.ok) {
                throw new Error('Erro na rede');
            }
            // Converte a resposta em JSON
            return response.json();
        })
        .then(data => {
            // Chama a função para renderizar os filmes
            renderFilms(data);
        })
        .catch(error => {
            // Loga o erro se houver um problema com a requisição Fetch
            console.error('Houve um problema com a requisição Fetch:', error);
        });
}

// Função responsável por renderizar os dados dos filmes
function renderFilms(data) {
    // Seleciona o container para os filmes
    const filmsList = document.querySelector('.films-grid-container');
    // Itera sobre os dados dos filmes
    data.forEach(film => {
        // Cria o HTML para o cartão do filme
        const filmCard = `
            <div class="film-card" key={${film.id}} >
                <img class="film-image" src="${film.image_film}" alt="">
                
            </div>
        `;
        // Adiciona o cartão do filme ao container
        filmsList.innerHTML += filmCard;

        // Seleciona todos os cartões de filmes
        const filmCards = document.querySelectorAll('.film-card');
        // Adiciona um evento de clique a cada cartão de filme
        filmCards.forEach((filmCard, index) => {
            filmCard.addEventListener('click', () => {
                // Redireciona para a página de informações do filme ao clicar
                window.location.href = `http://localhost/star-wars-teste-l5-networks/information_film?id=${data[index].id}`
            })
        })
    });
}


window.onload = fetchFilms;



