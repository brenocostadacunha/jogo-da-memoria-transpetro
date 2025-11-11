<template>
  <div class="result-page">
    <!-- Header -->
    <div class="header-section">
    </div>

    <!-- Content -->
    <div class="content-section">
      <picture v-if="isWin">
        <source
            media="(min-width: 768px) and (max-width: 1024px)"
            srcset="/ipad-imgs/venceu-ipad.svg"
        />
        <img
            src="/venceu.svg"
            alt="Você venceu!"
            class="result-image"
        />
      </picture>

      <img 
        v-else 
        src="/perdeu.svg" 
        alt="Você perdeu" 
        class="result-image"
      />
    </div>

    <div class="footer-section">
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
 // setTimeout(() => {
   // emit('return-to-start')
 // }, 5000)
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
  display: flex;
  align-items: center;
  justify-content: center;
  background: url('/header-resultado.svg') no-repeat center top;
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
  flex-shrink: 0;
  background: url('/footer-jogar.svg') no-repeat center bottom;
}

@media (min-width: 768px) and (max-width: 1024px) {

  .header-section {
    background: url('/ipad-imgs/ipad-header-jogar.svg')  no-repeat center top;
    aspect-ratio: 2.5;
  }

  .footer-section {
    background: url('/ipad-imgs/footer-ipad.svg') no-repeat center bottom
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

