<template>
  <div class="start-page">
    <!-- Header -->
    <div class="header-section">
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

    <div class="footer-section">
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
  background: url('/header-jogar.svg') no-repeat center top;
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
  background-image: url('/footer-jogar.svg');
}

/* Responsividades */

/* Estilos para telas de tablet (como iPads) */
@media (min-width: 768px) and (max-width: 1024px) {

  .header-section{
    aspect-ratio: 2;
    flex: 1 1 auto;
    background: url('/ipad-imgs/header-ipad.svg')  no-repeat center top;
  }

  .footer-section{
    aspect-ratio: 2.2;
    background-image: url('/ipad-imgs/footer-ipad.svg');
  }

  .content-section{
    top: 1rem;
    gap: 3rem;
  }

  .description{
    padding-inline: 3rem;
    font-size: 1.4rem;
    line-height: 2.1rem;
  }

  .play-button{
    font-size: 2.7rem;
    padding: 18px 36px;
  }

}


</style>

