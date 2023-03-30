<template>
  <div class="blackjack">
    <h1>Blackjack</h1>

    <div class="controls">
      <label for="bet">Bet: $</label>
      <input type="number" id="bet" v-model.number="bet" min="1" :max="maxBet" />
      <button @click="startGame">Start Game</button>
    </div>
    <div v-if="gameStarted">
      <h2>Your Hand: {{ playerHandValue }}</h2>
      <div class="hand">
        <div v-for="(card, index) in playerHand" :key="index" class="card">{{ card }}</div>
      </div>
      <h2>Dealer's Hand: {{ dealerHandValue }}</h2>
      <div class="hand">
        <div v-for="(card, index) in dealerHand" :key="'dealer' + index" class="card">{{ card }}</div>
      </div>
      <div class="action-buttons" v-if="!gameOver">
        <button @click="hit">Hit</button>
        <button @click="stand">Stand</button>
      </div>
      <div v-if="gameOver" class="result-section">
        <h2>Result</h2>
        <p>{{ message }}</p>
        <button @click="resetGame">Play Again</button>
      </div>
    </div>

  </div>
</template>
  
<script>
import { useMoneyStore } from '../stores/moneyStore';

export default {
  name: 'BlackjackComp',
  data() {
    return {
      bet: 100,
      maxBet: 0,
      playerHand: [],
      dealerHand: [],
      gameStarted: false,
      gameOver: false,
      message: '',
    };
  },
  computed: {
    playerHandValue() {
      return this.calculateHandValue(this.playerHand);
    },
    dealerHandValue() {
      return this.calculateHandValue(this.dealerHand);
    },
  },
  methods: {
    startGame() {
      const moneyStore = useMoneyStore();
      if (this.bet > moneyStore.money) {
        alert('You do not have enough money to bet this amount.');
        return;
      }

      moneyStore.decreaseMoney(this.bet);
      this.maxBet = moneyStore.money;
      this.gameStarted = true;
      this.gameOver = false;
      this.playerHand = [this.drawCard(), this.drawCard()];
      this.dealerHand = [this.drawCard(), this.drawCard()];
    },
    resetGame() {
      this.gameStarted = false;
      this.gameOver = false;
      this.message = '';
    },
    drawCard() {
      const ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'];
      const suits = ['♠', '♣', '♦', '♥'];
      const rank = ranks[Math.floor(Math.random() * ranks.length)];
      const suit = suits[Math.floor(Math.random() * suits.length)];
      return `${rank}${suit}`;
    },
    calculateHandValue(hand) {
      let value = 0;
      let aces = 0;

      hand.forEach((card) => {
        let rank = card.slice(0, -1);
        let rankValue;

        if (['J', 'Q', 'K'].includes(rank)) {
          rankValue = 10;
        } else if (rank === 'A') {
          rankValue = 11;
          aces++;
        } else {
          rankValue = parseInt(rank);
        }

        value += rankValue;
      });

      // Handle aces
      while (value > 21 && aces > 0) {
        value -= 10;
        aces--;
      }

      return value;
    },
    hit() {
      this.playerHand.push(this.drawCard());

      if (this.playerHandValue > 21) {
        this.gameOver = true;
        this.message = 'Busted! You lost.';
      }
    },
    stand() {
      while (this.dealerHandValue < 17) {
        this.dealerHand.push(this.drawCard());
      }

      if (this.dealerHandValue > 21) {
        this.gameOver = true;
        this.message = 'Dealer busts! You won!';
        const moneyStore = useMoneyStore();
        moneyStore.increaseMoney(this.bet * 2);
      } else if (this.dealerHandValue > this.playerHandValue) {
        this.gameOver = true;
        this.message = 'Dealer wins!';
      } else if (this.dealerHandValue === this.playerHandValue) {
        this.gameOver = true;
        this.message = 'Push! You get your bet back.';
        const moneyStore = useMoneyStore();
        moneyStore.increaseMoney(this.bet);
      } else {
        this.gameOver = true;
        this.message = 'You win!';
        const moneyStore = useMoneyStore();
        moneyStore.increaseMoney(this.bet * 2);
      }
    },
  },
  created() {
    const moneyStore = useMoneyStore();
    this.maxBet = moneyStore.money;
  },
};
</script>

<style scoped>
.blackjack {
  text-align: center;
}

.controls {
  display: flex;
  justify-content: center;
  gap: 1rem;
}

.hand {
  display: flex;
  justify-content: center;
  gap: 1rem;
}

.card {
  background-color: white;
  border: 1px solid black;
  padding: 1rem 0.5rem;
  font-size: 1.5rem;
}

.action-buttons {
  display: flex;
  justify-content: center;
  gap: 2rem;
  margin-top: 1rem;
}

.result-message {
  text-align: center;
  margin-top: 1rem;
}

button {
  background-color: #000000;
  border: none;
  color: white;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  transition-duration: 0.4s;
  cursor: pointer;
  padding: 0.2rem 1rem;
  border-radius: 4px;
}

button:hover {
  background-color: #1e1e1e;
}

.result-section {
  margin-top: 2rem;
  border-top: 1px solid #ccc;
  padding-top: 1rem;
}

</style>