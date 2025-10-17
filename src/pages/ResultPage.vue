<template>
  <div class="result-page">
    <!-- Header -->
    <div class="header-section" style="background-image: url('/header-resultado.svg');">
    </div>

    <!-- Content -->
    <div class="content-section">
      <img 
        v-if="isWin" 
        src="/venceu.svg" 
        alt="Você venceu!" 
        class="result-image"
      />
      <img 
        v-else 
        src="/perdeu.svg" 
        alt="Você perdeu" 
        class="result-image"
      />
    </div>

    <div class="footer-section" style="background-image: url('/footer-jogar.svg');">
    </div>
  </div>
</template>

<script setup>
import { onMounted } from 'vue'

const props = defineProps({
  isWin: Boolean
})

const emit = defineEmits(['return-to-start'])

onMounted(() => {
  // Após 5 segundos, retornar para a página inicial
  setTimeout(() => {
    emit('return-to-start')
  }, 5000)
})
</script>

<style scoped>
.result-page {
  min-height: 100vh;
  background: #008542;
  display: flex;
  flex-direction: column;
  font-family: 'Inter', sans-serif;
  position: relative;
  overflow-y: auto;
}

.header-section {
  position: relative;
  width: 100%;
  aspect-ratio: 2;
  background-size: 100%;
  background-repeat: no-repeat;
  background-position: center top;
  display: flex;
  align-items: center;
  justify-content: center;
}

.content-section {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  flex: 1 1 auto;
  position: relative;
  z-index: 5;
}

.result-image {
  width: auto;
  height: auto;
  object-fit: contain;
}

.footer-section {
  flex: 1 1 auto;
  width: 100%;
  aspect-ratio: 2.1;
  background-size: 100%;
  background-position: center bottom;
  background-repeat: no-repeat;
  flex-shrink: 0;
}

@media (max-width: 768px) {
  .result-image {
    max-width: 90%;
    max-height: 300px;
  }
}

@media (max-width: 480px) {
  .result-image {
    max-width: 95%;
    max-height: 250px;
  }
  
  .content-section {
    padding: 1rem;
  }
}
</style>

