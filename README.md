# Jogo da Memória - BR TRANSPETRO

Um jogo da memória interativo desenvolvido em Vue.js com design responsivo para múltiplas plataformas.

## 🎮 Características

- **Grade 4x4**: 16 cartas em total (8 pares) - cartas grandes ocupando boa parte da tela
- **Design Responsivo**: Adapta-se a diferentes resoluções:
  - 📱 Mobile (até 480px)
  - 💻 Desktop Full HD (1920x1080)
  - 🏢 Totem Vertical (1080x1920)
- **Sistema de Ranking**: Leaderboard com os melhores tempos salvos no navegador
- **Input de Nome**: Digite seu nome antes de jogar para aparecer no ranking
- **Cronômetro**: Timer que inicia após clicar em "JOGAR" e conta o tempo de resolução
- **Configuração via JSON**: Fácil personalização de imagens, textos e verso das cartas
- **Animações**: Efeitos de flip suaves e feedback visual
- **Contador de Movimentos**: Acompanha o progresso do jogador

## 🚀 Como Executar

### Instalação das Dependências
```sh
npm install
```

### Executar em Desenvolvimento
```sh
npm run dev
```

### Compilar para Produção
```sh
npm run build
```

## ⚙️ Configuração

### Personalizar Cartas
Edite o arquivo `src/data/gameConfig.json` para:

- **Adicionar/Remover Cartas**: Modifique o array `cards`
- **Alterar Imagens**: Substitua as URLs das imagens
- **Mudar Textos**: Edite os textos das cartas
- **Personalizar Verso**: Modifique `cardBack`
- **Ajustar Configurações**: Altere `gameSettings`

### Estrutura do JSON
```json
{
  "cards": [
    {
      "id": 1,
      "image": "URL_DA_IMAGEM",
      "text": "TEXTO_DA_CARTA"
    }
  ],
  "cardBack": {
    "image": "URL_IMAGEM_VERSO",
    "text": "TEXTO_VERSO"
  },
  "gameSettings": {
    "gridSize": 4,
    "flipDelay": 1000,
    "gameTime": 300
  }
}
```

> **Nota**: Agora o jogo usa grade 4x4 (8 cartas únicas que formam 8 pares = 16 cartas total)

## 📱 Resoluções Suportadas

### Mobile (até 768px)
- Layout otimizado para touch
- Fontes menores para melhor legibilidade
- Espaçamento reduzido

### Desktop Full HD (1920x1080)
- Layout em landscape
- Grade bem espaçada
- Interface ampliada

### Totem Vertical (1080x1920)
- Layout otimizado para orientação portrait
- Elementos maiores para melhor visibilidade
- Ideal para displays públicos

## 🎯 Como Jogar

1. **Digite seu nome** no campo de entrada
2. Clique em "JOGAR" para iniciar
3. O cronômetro começará a contar automaticamente
4. Clique em duas cartas para virá-las
5. Se as cartas forem iguais, elas ficam viradas
6. Se forem diferentes, elas voltam ao verso
7. Encontre todos os 8 pares antes do tempo acabar!
8. **Seu tempo será salvo no ranking** se você completar o jogo
9. Veja o leaderboard com os melhores tempos

## 🏆 Sistema de Ranking

- Os **10 melhores tempos** são salvos automaticamente no navegador
- O ranking é ordenado do **menor tempo** (melhor) para o maior
- Cada entrada mostra: **Posição**, **Nome** e **Tempo**
- Seu resultado atual aparece destacado no ranking
- Os dados são mantidos mesmo após fechar o navegador

## 🛠️ Tecnologias Utilizadas

- **Vue.js 3**: Framework JavaScript reativo
- **Vite**: Build tool moderno e rápido
- **CSS Grid**: Layout responsivo da grade
- **CSS Animations**: Efeitos de flip das cartas

## 📁 Estrutura do Projeto

```
src/
├── components/
│   ├── MemoryCard.vue      # Componente individual da carta
│   └── MemoryGame.vue      # Componente principal do jogo
├── data/
│   └── gameConfig.json     # Configurações e dados das cartas
├── App.vue                 # Componente raiz
└── main.js                # Ponto de entrada da aplicação
```

## 🎨 Personalização Visual

O jogo usa um esquema de cores verde baseado na identidade visual da TRANSPETRO. Para personalizar:

1. **Cores**: Modifique as variáveis CSS nos componentes
2. **Fontes**: Altere a propriedade `font-family`
3. **Logo**: Substitua o texto "BR TRANSPETRO" no cabeçalho
4. **Imagens**: Atualize as URLs no arquivo JSON

## 📝 Licença

Este projeto foi desenvolvido para uso interno da TRANSPETRO.