<template>
  <div class="modal-overlay">
    <div class="modal-content">
      <h2 v-if="isWin">🎉 Parabéns!</h2>
      <h2 v-else>⏰ Tempo Esgotado!</h2>
      
      <div class="game-stats">
        <p v-if="isWin"><strong>Você venceu!</strong></p>
        <p v-else><strong>Tente novamente!</strong></p>
        <p><strong>Movimentos:</strong> {{ moves }}</p>
        <p><strong>Tempo restante:</strong> {{ formatTime(gameTime) }}</p>
      </div>
      
      <div class="modal-buttons">
        <button class="restart-button" @click="$emit('restart')">
          🎮 Jogar Novamente
        </button>
        <button class="home-button" @click="$emit('return-to-start')">
          🏠 Voltar ao Início
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  isWin: Boolean,
  gameTime: Number,
  moves: Number
})

defineEmits(['restart', 'return-to-start'])

const formatTime = (seconds) => {
  const mins = Math.floor(seconds / 60)
  const secs = seconds % 60
  return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`
}
</script>

<style scoped>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.8);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 20;
}

.modal-content {
  background: white;
  padding: 40px;
  border-radius: 16px;
  text-align: center;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
  max-width: 460px;
  width: 90%;
  max-height: 85vh;
  overflow-y: auto;
}

h2 {
  color: #008542;
  margin: 0 0 16px 0;
  font-size: 1.8em;
}

.game-stats {
  background: #f5f5f5;
  padding: 16px;
  border-radius: 8px;
  margin: 16px 0;
}

.game-stats p {
  margin: 8px 0;
  font-size: 1.1em;
}

.modal-buttons {
  display: flex;
  flex-direction: column;
  gap: 12px;
  justify-content: center;
  margin-top: 24px;
}

.restart-button {
  background: linear-gradient(135deg, #008542 0%, #006633 100%);
  color: white;
  border: none;
  padding: 14px 28px;
  border-radius: 8px;
  font-size: 1em;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(0, 133, 66, 0.4);
}

.restart-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(0, 133, 66, 0.6);
}

.home-button {
  background: linear-gradient(135deg, #444444 0%, #222222 100%);
  color: white;
  border: none;
  padding: 14px 28px;
  border-radius: 8px;
  font-size: 1em;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.home-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.5);
}

@media (min-width: 1920px) {
  .modal-content {
    max-width: 420px;
    padding: 35px;
  }
  
  h2 {
    font-size: 1.6em;
  }
  
  .game-stats {
    padding: 14px;
  }
  
  .game-stats p {
    font-size: 0.95em;
  }
  
  .leaderboard-section h3 {
    font-size: 1.2em;
  }
  
  .leaderboard {
    max-height: 230px;
  }
  
  .leaderboard-entry {
    padding: 10px 14px;
  }
  
  .modal-buttons button {
    padding: 12px 24px;
    font-size: 0.95em;
  }
}

@media (max-width: 480px) {
  .modal-content {
    padding: 24px;
  }
  
  h2 {
    font-size: 1.5em;
  }
  
  .leaderboard-section h3 {
    font-size: 1.1em;
  }
  
  .modal-buttons button {
    padding: 12px 20px;
    font-size: 0.95em;
  }
}
</style>

