<template>
  <div class="clicker">
    <h1>Part Time Job - Clicker</h1>
    <p>Click the button below to earn $1 per click!</p>
    <button class="clicker-button" @click="earnMoney(1)">Click to Earn</button>
    <p>Your current balance: ${{ money }}</p>
  </div>
</template>

<script>
import { useMoneyStore } from '../stores/moneyStore';
import { money } from '../auth';

export default {
  name: 'ClickerComp',
  setup() {
    const moneyStore = useMoneyStore();
    const earnMoney = (amount) => moneyStore.increaseMoney(amount);

    return {
      earnMoney,
      money,
    };
  },
};
</script>

<style scoped>
.clicker {
  text-align: center;
}

.clicker-button {
  color: rgb(0, 0, 0);

}

.clicker-button:hover {
  color: rgb(255, 176, 176);
}
</style>
