<template>
  <div class="memory-game">
    <div class="header-hero" style="background-image: url('/header.svg');">
    </div>

    <!-- Timer -->
    <div class="timer-section" v-if="gameStarted">
      <div class="timer-display">
        <span v-if="memorizing">{{ formatTime(memorizationTime) }}</span>
        <span v-else>{{ formatTime(gameTime) }}</span>
      </div>
    </div>

    <!-- Game Board -->
    <div class="game-board">
      <div class="cards-container" ref="cardsContainerRef">
        <div class="cards-grid" ref="cardsGridRef" :style="gridStyle">
          <MemoryCard
            v-for="card in gameCards"
            :key="card.uniqueId"
            :card="card"
            :card-back="gameConfig.cardBack"
            :is-flipped="card.isFlipped"
            :is-matched="card.isMatched"
            @card-click="handleCardClick"
          />
        </div>
      </div>
    </div>

    <!-- Vídeo ao terminar o jogo -->
    <div v-if="showVideo" class="video-overlay">
      <video
        class="end-game-video"
        autoplay
        @ended="handleVideoEnd"
      >
        <source src="/videos/Roubo nos dutos Vertical V3 (2) (1).mp4" type="video/mp4">
      </video>
    </div>


  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted, nextTick } from 'vue'
import MemoryCard from './MemoryCard.vue'
import gameConfig from '../data/gameConfig.json'

const emit = defineEmits(['show-result'])

// Game state
const gameStarted = ref(false)
const gameOver = ref(false)
const isWin = ref(false)
const memorizing = ref(true) // Fase de memorização
const memorizationTime = ref(10) // 10 segundos para memorizar
const gameTime = ref(60) // 60 segundos de jogo (regressivo)
const moves = ref(0)
const gameCards = ref([])
const flippedCards = ref([])
const matchedPairs = ref(0)
const totalPairs = ref(0)
const showVideo = ref(false) // Controla exibição do vídeo
let gameTimer = null

// Layout refs e largura máxima calculada para evitar corte
const cardsContainerRef = ref(null)
const cardsGridRef = ref(null)


// Computed properties
const gridStyle = computed(() => {
  const gridSize = gameConfig.gameSettings.gridSize
  return {
    gridTemplateColumns: `repeat(${gridSize}, 1fr)`,
  }
})


const initializeGame = () => {
  const allCards = [...gameConfig.cards, ...gameConfig.cards]

  const cardsWithIds = allCards.map((card, index) => ({
    ...card,
    uniqueId: index,
    isFlipped: true,
    isMatched: false
  }))
  
  gameCards.value = shuffleArray(cardsWithIds)
  totalPairs.value = gameConfig.cards.length
  matchedPairs.value = 0
  moves.value = 0
  flippedCards.value = []
  gameOver.value = false
  isWin.value = false
  memorizing.value = true
  memorizationTime.value = 10
  gameTime.value = 60
}

const shuffleArray = (array) => {
  const shuffled = [...array]
  for (let i = shuffled.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]]
  }
  return shuffled
}

const startGame = () => {
  gameStarted.value = true
  startMemorizationTimer()
}

const startMemorizationTimer = () => {
  memorizing.value = true
  memorizationTime.value = 10
  
  gameTimer = setInterval(() => {
    memorizationTime.value--
    
    if (memorizationTime.value <= 0) {
      clearInterval(gameTimer)
      gameCards.value.forEach(card => {
        if (!card.isMatched) {
          card.isFlipped = false
        }
      })
      memorizing.value = false
      startGameTimer()
    }
  }, 1000)
}

const startGameTimer = () => {
  gameTime.value = 60
  
  gameTimer = setInterval(() => {
    gameTime.value--
    
    if (gameTime.value <= 0) {
      endGame(false)
    }
  }, 1000)
}

const endGame = (won) => {
  gameOver.value = true
  isWin.value = won
  gameStarted.value = false
  memorizing.value = false
  
  if (gameTimer) {
    clearInterval(gameTimer)
    gameTimer = null
  }
  
  // Mostrar vídeo ao invés do modal
  showVideo.value = true
}

const handleVideoEnd = () => {
  showVideo.value = false
  // Ir para a página de resultado após o vídeo
  emit('show-result', isWin.value)
}

const handleCardClick = (clickedCard) => {
  if (!gameStarted.value || gameOver.value || memorizing.value) return
  
  // Don't allow clicking already flipped or matched cards
  if (clickedCard.isFlipped || clickedCard.isMatched) return
  
  // Don't allow clicking if we already have 2 cards flipped (waiting for result)
  if (flippedCards.value.length >= 2) return
  
  // Flip the card
  const cardIndex = gameCards.value.findIndex(card => card.uniqueId === clickedCard.uniqueId)
  gameCards.value[cardIndex].isFlipped = true
  
  flippedCards.value.push(gameCards.value[cardIndex])
  
  // Check if we have two cards flipped
  if (flippedCards.value.length === 2) {
    moves.value++
    
    const [card1, card2] = flippedCards.value
    
    if (card1.id === card2.id) {
      // Match found!
      setTimeout(() => {
        card1.isMatched = true
        card2.isMatched = true
        matchedPairs.value++
        
        // Check if game is won
        if (matchedPairs.value === totalPairs.value) {
          endGame(true)
        }
        
        flippedCards.value = []
      }, gameConfig.gameSettings.flipDelay)
    } else {
      // No match, flip cards back
      setTimeout(() => {
        card1.isFlipped = false
        card2.isFlipped = false
        flippedCards.value = []
      }, gameConfig.gameSettings.flipDelay)
    }
  }
}

const restartGame = () => {
  if (gameTimer) {
    clearInterval(gameTimer)
    gameTimer = null
  }
  gameStarted.value = false
  gameOver.value = false
  initializeGame()
  setTimeout(() => {
    startGame()
  }, 100)
}

const handleReturnToStart = () => {
  if (gameTimer) {
    clearInterval(gameTimer)
    gameTimer = null
  }
  emit('show-result', isWin.value)
}

const formatTime = (seconds) => {
  const mins = Math.floor(seconds / 60)
  const secs = seconds % 60
  return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`
}




onMounted(async () => {
  initializeGame()
  await nextTick()
  startGame()
})

onUnmounted(() => {
  if (gameTimer) {
    clearInterval(gameTimer)
  }
})

</script>

<style scoped>
.memory-game {
  min-height: 100vh;
  background: #008542;
  display: flex;
  flex-direction: column;
  font-family: 'Inter',sans-serif;
  position: relative;
  overflow-y: auto;
}

.header-hero {
  position: relative;
  width: 100%;
  aspect-ratio: 2.8;
  background: no-repeat;
  background-position: center top;
  display: flex;
  align-items: center;
  justify-content: center;

}


.timer-section {
  top: -2.625rem;
  margin-bottom: -2.625rem;
  display: flex;
  justify-content: center;
  padding: 18px 0;
  position: relative;
  z-index: 5;
}

.timer-display {
  background: linear-gradient(270deg, #10A916 0%, #008D48 100%);
  color: #ffffff;
  border-radius: 16px;
  font-weight: 700;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.18);
  text-align: center;
  border: 0;
  font-size: 3.75rem;
  padding: 11px 34px;
}

/* Game Board */
.game-board {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 3rem;
  width: 100%;
  flex: 1 1 auto;
}

.cards-container {
  width: 100%;
  max-width: 95%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.cards-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 2.2rem;
  width: 100%;
  max-width: 100%;
  height: auto;
}



/* Vídeo Overlay */
.video-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: #000000;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}

.end-game-video {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

/* Responsividade */
@media (max-width: 768px) {

}

@media (max-width: 480px) {

  .header-art {
    width: 98%;
    height: 100%;
    object-fit: cover;
    object-position: center;
    display: block;
  }

  .timer-section {
    padding: 10px 0;
  }
  
  .timer-display {
    font-size: clamp(15px, 4.2vw, 20px);
    padding: 8px 18px;
    min-width: 110px;
  }
  
  .game-board {
    padding: 0 8px 10px;
  }
  
  .cards-container {
    max-width: 98%;
    padding: 0 5px;
  }
  
  .cards-grid {
    max-width: min(98vw, 400px);
  }
}

/* Tablets em paisagem */
@media (min-width: 769px) and (max-width: 1024px) {

}

/* Notebooks e Desktops */
@media (min-width: 1025px) and (max-width: 1919px) {


}

@media (min-width: 1080px) and (min-height: 1920px) and (max-width: 1200px) {


}
</style>
