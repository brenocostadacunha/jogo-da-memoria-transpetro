<script setup>
import { ref } from 'vue'
import StartPage from './pages/StartPage.vue'
import ResultPage from './pages/ResultPage.vue'
import MemoryGame from './components/MemoryGame.vue'

const currentPage = ref('result')
const gameResult = ref(true)

const startGame = () => {
  currentPage.value = 'game'
}

const showResult = (isWin) => {
  gameResult.value = isWin
  currentPage.value = 'result'
}

const returnToStart = () => {
  currentPage.value = 'start'
}
</script>

<template>
  <StartPage v-if="currentPage === 'start'" @start-game="startGame" />
  <MemoryGame v-if="currentPage === 'game'" @show-result="showResult" />
  <ResultPage v-if="currentPage === 'result'" :is-win="gameResult" @return-to-start="returnToStart" />
</template>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body {
  min-height: 100%;
  overflow-y: auto;
  font-family: 'Arial', sans-serif;
}

#app {
  min-height: 100vh;
}
</style>
