<template>
  <div class="start-page">
    <!-- Header -->
    <div class="header-section" style="background-image: url('/header-jogar.svg');">
    </div>

    <!-- Content -->
    <div class="content-section">
      <p class="description">
        Você testará agora seus conhecimentos sobre a atuação da Transpetro como uma das maiores operadoras no segmento dutoviário do país. Transportamos petróleo e seus derivados, provendo soluções logísticas para o segmento de óleo, gás e produtos de baixo carbono, contribuindo para o desenvolvimento humano e social, de forma ética, justa, segura e competitiva.
      </p>

      <button class="play-button" @click="$emit('start-game')">
        JOGAR
      </button>
    </div>

    <div class="footer-section" style="background-image: url('/footer-jogar.svg');">
    </div>
  </div>
</template>

<script setup>
defineEmits(['start-game'])
</script>

<style scoped>
.start-page {
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
  aspect-ratio: 1.3;
  background-size: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background-position: center top;
  background: no-repeat;
}

.content-section {
  top: -3rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  gap: 7rem;
  position: relative;
  z-index: 5;
}


.description {
  padding-inline: 5rem;
  font-size: 1.8rem;
  line-height: 1.5;
  color: #ffffff;
  margin: 0;
  font-weight: bold;
  text-align: center;
}

.play-button {
  background: linear-gradient(270deg, #10A916 0%, #008D48 100%);
  color: #ffffff;
  border-radius: 16px;
  font-weight: 700;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.18);
  text-align: center;
  border: 0;
  font-size: 3.75rem;
  padding: 18px 50px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.play-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
}

.play-button:active {
  transform: translateY(0);
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


</style>

