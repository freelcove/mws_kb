import { ref } from "vue";


const money = ref(0);

const increaseMoney = (amount) => {
  money.value += amount;
};

const decreaseMoney = (amount) => {
    money.value -= amount;
  };

const useMoneyStore = () => {
  return {
    money,
    increaseMoney,
    decreaseMoney,
  };
};  

export { useMoneyStore };
