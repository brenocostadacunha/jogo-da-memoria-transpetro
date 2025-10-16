<template>
  <div class="modal-overlay">
    <div class="modal-content">
      <div class="logo-container">
        <img src="/petrobras.svg" alt="Petrobras" class="petrobras-logo-modal" />
      </div>
      
      <div class="game-title">
        <h2>Jogo da Memória</h2>
      </div>
      
      <div class="form-container">
        <div class="form-group">
          <label>Nome</label>
          <input 
            v-model="localPlayerName" 
            type="text" 
            placeholder="Digite seu nome"
            maxlength="50"
            @keyup.enter="playerPhone ? handleStart() : null"
          />
        </div>
        
        <div class="form-group">
          <label>Telefone</label>
          <input 
            v-model="localPlayerPhone" 
            type="tel" 
            placeholder="(11) 11111-1111"
            maxlength="15"
            @keyup.enter="localPlayerName.trim() && localPlayerPhone.trim() ? handleStart() : null"
          />
        </div>
        
        <div class="terms-check">
          <input 
            type="checkbox" 
            id="terms" 
            v-model="localAcceptedTerms"
          />
          <label for="terms">
            Li e concordo com o <a href="#" @click.prevent>Termos de Serviço</a>
          </label>
        </div>
        
        <button 
          class="start-button" 
          @click="handleStart"
          :disabled="!localPlayerName.trim() || !localPlayerPhone.trim() || !localAcceptedTerms"
        >
          Jogar
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const props = defineProps({
  playerName: String,
  playerPhone: String,
  acceptedTerms: Boolean
})

const emit = defineEmits(['start', 'update:playerName', 'update:playerPhone', 'update:acceptedTerms'])

const localPlayerName = ref(props.playerName || '')
const localPlayerPhone = ref(props.playerPhone || '')
const localAcceptedTerms = ref(props.acceptedTerms || false)

const handleStart = () => {
  if (!localPlayerName.value.trim() || !localPlayerPhone.value.trim() || !localAcceptedTerms.value) return
  
  emit('update:playerName', localPlayerName.value)
  emit('update:playerPhone', localPlayerPhone.value)
  emit('update:acceptedTerms', localAcceptedTerms.value)
  emit('start')
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
  max-width: 420px;
  width: 90%;
  max-height: 85vh;
  overflow-y: auto;
}

.logo-container {
  margin-bottom: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.petrobras-logo-modal {
  height: 60px;
  width: auto;
  object-fit: contain;
}

.game-title {
  background: linear-gradient(135deg, #008542 0%, #006633 100%);
  padding: 16px 28px;
  border-radius: 12px;
  margin-bottom: 30px;
  box-shadow: 0 4px 12px rgba(0, 133, 66, 0.3);
}

.game-title h2 {
  color: white;
  margin: 0;
  font-size: 1.5em;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.form-container {
  text-align: left;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  color: #333;
  font-weight: 600;
  margin-bottom: 8px;
  font-size: 0.95em;
}

.form-group input {
  width: 100%;
  padding: 12px 16px;
  border: 2px solid #e0e0e0;
  border-radius: 8px;
  font-size: 1em;
  background: white;
  transition: all 0.3s ease;
}

.form-group input:focus {
  outline: none;
  border-color: #008542;
  background: #f9f9f9;
}

.terms-check {
  display: flex;
  align-items: flex-start;
  gap: 10px;
  margin-bottom: 20px;
}

.terms-check input[type="checkbox"] {
  margin-top: 3px;
  width: 18px;
  height: 18px;
  cursor: pointer;
}

.terms-check label {
  color: #333;
  font-size: 0.9em;
  line-height: 1.4;
  text-align: left;
}

.terms-check a {
  color: #008542;
  text-decoration: underline;
}

.start-button {
  width: 100%;
  background: linear-gradient(135deg, #FDC82F 0%, #FFD700 100%);
  color: #000;
  border: none;
  padding: 16px 32px;
  border-radius: 8px;
  font-size: 1.2em;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(253, 200, 47, 0.4);
}

.start-button:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(253, 200, 47, 0.6);
  background: linear-gradient(135deg, #FFD700 0%, #FDC82F 100%);
}

.start-button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
  transform: none;
}

@media (min-width: 1920px) {
  .modal-content {
    max-width: 380px;
    padding: 35px;
  }
  
  .petrobras-logo-modal {
    height: 55px;
  }
  
  .game-title h2 {
    font-size: 1.4em;
  }
  
  .form-group label {
    font-size: 0.9em;
  }
  
  .form-group input {
    padding: 10px 14px;
    font-size: 0.95em;
  }
  
  .start-button {
    padding: 14px 28px;
    font-size: 1.1em;
  }
}

@media (max-width: 480px) {
  .modal-content {
    padding: 24px;
  }
  
  .petrobras-logo-modal {
    height: 45px;
  }
  
  .game-title h2 {
    font-size: 1.2em;
  }
  
  .start-button {
    padding: 14px 24px;
    font-size: 1.1em;
  }
}
</style>

