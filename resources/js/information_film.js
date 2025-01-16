//Função Responsável por chamar a API de Filmes

function fetchAllData() {
    // Realiza fetch para os dados de filmes, personagens, relacionamentos entre filmes e personagens e planetas
    const filmFetch = fetch('http://localhost/star-wars-teste-l5-networks/films');
    const characterFetch = fetch('http://localhost/star-wars-teste-l5-networks/characters');
    const filmsCharactersFetch = fetch('http://localhost/star-wars-teste-l5-networks/films_characters');
    const planetsFetch = fetch('http://localhost/star-wars-teste-l5-networks/planets')

    // Utiliza Promise.all para esperar todas as requisições serem concluídas
    Promise.all([filmFetch, characterFetch, filmsCharactersFetch, planetsFetch])
        .then(responses => {
            // Verifica se todas as respostas foram bem-sucedidas
            responses.forEach(response => {
                if (!response.ok) {
                    throw new Error('Erro na rede');
                }
            });
            // Converte as respostas em JSON
            return Promise.all(responses.map(response => response.json()));
        })
        .then(([films, characters, filmsCharacters, planets]) => {
            // Chama a função para renderizar as informações do filme
            RenderInformationFilm(films, characters, filmsCharacters, planets);
        })
        .catch(error => {
            // Loga o erro se houver um problema com a requisição Fetch
            console.error('Houve um problema com a requisição Fetch:', error);
        });
}

// Função para renderizar as informações do filme
function RenderInformationFilm(films, characters, filmsCharacters, planets) {

    // Obtém o parâmetro 'id' da URL
    const urlParams = new URLSearchParams(window.location.search);
    const id = urlParams.get('id');

    // Seleciona a seção do filme na página
    const filmSection = document.querySelector('.film-section');
    // Encontra o filme específico com base no 'id'
    const film = films.find(film => film.id == id);

    // Cria a string de informações do filme
    const filmsInformation = `
 
   <img class="film-image" src="${film.image_film}" alt="">
    <div class="film-text-container">
        <h1 class="film-title">Star Wars - Episode ${film.episode_id} - ${film.title}</h1>
        <p class="film-episode"><strong>Episode : </strong> ${film.episode_id}</p>
        <p class="release_date"><strong>Release Date: </strong> ${film.release_date}</p>
        <p class="director"><strong>Director: </strong>${film.director}</p>
        <p class="producer"><strong>Producer: </strong>${film.producer}</p>
        <p class="film_age"><strong>Film Age: </strong>${film.film_age}</p>
        <button class="primary btn-exit">Back to Catalog</button>
    </div>
    `;
    // Adiciona as informações do filme à seção do filme
    filmSection.innerHTML += filmsInformation

    //Seleciona todos os botões de voltar a pagina principal
    const btnExit = document.querySelectorAll('.btn-exit');
    //Adição da função de voltar a pagina principal para todos os botões
    btnExit.forEach((button, index)=>{
        button.addEventListener('click', () => {
            window.location.href = "http://localhost/star-wars-teste-l5-networks"
        })
    })

    // Seleciona a seção do crawl de abertura na página
    const openingCrawlSection = document.querySelector('.opening-crawl-section');

    // Cria a string do crawl de abertura
    const openingCrawl = `
    <p class="opening_crawl">${film.opening_crawl}</p>
    `;
    // Adiciona o crawl de abertura à seção do crawl de abertura
    openingCrawlSection.innerHTML += openingCrawl

    // Inserção dos dados dos Personagens do Filme
    // Seleciona o container de personagens na página
    const charactersContainerGrid = document.querySelector('.characters-container-grid');

    // Filtra os personagens por filme
    const charactersFilms = filmsCharacters.filter(filmCharacter => filmCharacter.film_id == id);

    // Limpa o container de personagens antes de adicionar novos
    charactersContainerGrid.innerHTML = '';

    // Itera sobre os personagens do filme
    charactersFilms.forEach((characterFilm) => {
        // Encontra o personagem específico com base no 'id'
        const character = characters.find(character => character.id == characterFilm.character_id);
        // Filtra o planeta do personagem
        const planet = planets.find(planet => planet.id == character.homeworld_id);
        
        // Cria a string de informações do personagem
        const charactersInformation = `
         <div class="character">
             <h2>${character.name}</h2>
             <p><strong>Origin Planet: </strong>${planet.name}</p>
             <button class="primary btn-character" data-toggle="modal" data-target="#exampleModal">Informations</button>
           </div>
        `;
        // Adiciona as informações do personagem ao container de personagens
        charactersContainerGrid.innerHTML += charactersInformation;
    });

    // Seleciona todos os botões de personagem após a adição
    const btnCharacter = charactersContainerGrid.querySelectorAll('.btn-character');

    // Adiciona um listener de eventos para cada botão de personagem
    btnCharacter.forEach((button, index) => {
        button.addEventListener('click', () => {
            // Encontra o personagem correspondente ao botão clicado
            const characterFilm = charactersFilms[index];
            const character = characters.find(character => character.id == characterFilm.character_id);
            const planet = planets.find(planet => planet.id == character.homeworld_id);
            
            // Seleciona o título e o corpo do modal
            const modalTitle = document.querySelector('.modal-title');
            const modalBody = document.querySelector('.modal-body');

            // Atualiza o título do modal com o nome do personagem
            modalTitle.innerHTML = `<h2>${character.name}</h2>`;
            // Cria a string de informações detalhadas do personagem
            modalBody.innerHTML = `
        <div class="character-information-div">
            <p class="character-name"><strong>Height: </strong>${character.height} cm</p>
            <p class="character-origin"><strong>Mass: </strong>${character.mass} kg</p>
            <p class="character-age"><strong>Hair Color: </strong>${character.hair_color}</p>
            <p class="character-cor"><strong>Skin Color: </strong>${character.skin_color}</p>
            <p class="character-height"><strong>Eye Color: </strong>${character.eye_color}</p>
            <p class="character-birth-year"><strong>Birth Year: </strong>${character.birth_year}</p>
            <p class="character-gender"><strong>Gender: </strong>${character.gender}</p>
            <p class="character-planet"><strong>Origin Planet: </strong>${planet.name}</p>
        </div>
        `;
        });
    });

}

// Chama a função fetchAllData quando a página é carregada
window.onload = fetchAllData;