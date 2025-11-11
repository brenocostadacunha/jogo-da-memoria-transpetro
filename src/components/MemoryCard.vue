<template>
  <div 
    class="memory-card" 
    :class="{ 'flipped': isFlipped, 'matched': isMatched }"
    @click="handleClick"
  >
    <div class="card-inner">
      <div class="card-front">
        <img :src="cardBack.image" :alt="cardBack.text || 'Card Back'" class="back-image" />
      </div>
      <div class="card-back">
        <img :src="card.image" :alt="card.text" class="card-image" />
        <div class="text-overlay">
          <span class="card-text">{{ card.text }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps, defineEmits } from 'vue'

const props = defineProps({
  card: {
    type: Object,
    required: true
  },
  cardBack: {
    type: Object,
    required: true
  },
  isFlipped: {
    type: Boolean,
    default: false
  },
  isMatched: {
    type: Boolean,
    default: false
  }
})

const emit = defineEmits(['card-click'])

const handleClick = () => {
  if (!props.isFlipped && !props.isMatched) {
    emit('card-click', props.card)
  }
}
</script>

<style scoped>
.memory-card {
  aspect-ratio: 7 / 10;
  width: 100%;
  perspective: 1000px;
  cursor: pointer;
  user-select: none;
}

.card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.6s;
  transform-style: preserve-3d;
}

.memory-card.flipped .card-inner {
  transform: rotateY(180deg);
}

.card-front,
.card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
  border-radius: 12px;
  border: 0.4rem solid #FDC82F;
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
  overflow: hidden;
  background: white;
}

.card-front {
  display: flex;
  align-items: center;
  justify-content: center;
}

.card-back {
  transform: rotateY(180deg);
  position: relative;
  padding: 0;
}

.back-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
  display: block;
}

.card-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.text-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.85) 0%, rgba(0, 125, 64, 0) 100%);
  padding: 12px 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 20%;
}

.card-text {
  font-size: 1rem;
  font-weight: 700;
  text-align: center;
  color: white;
  line-height: 1.2;
  hyphens: auto;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);
  letter-spacing: 0.3px;
}

.memory-card.matched {
  opacity: 0.7;
  transform: scale(0.95);
}

.memory-card.matched .card-inner {
  transform: rotateY(180deg);
}
@media (min-width: 768px) and (max-width: 1024px) {

  .card-text {
    font-size: 0.625rem;
    font-weight: 600;
  }

}



</style>
