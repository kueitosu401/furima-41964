const pay = () => {
  const payjp = Payjp('pk_test_116d1896c294d2b5086f3187'); 
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        alert(response.error.message); 
      } else {
        const token = response.id;
        const tokenObj = `<input type="hidden" name="order_address[token]" value="${token}">`;
        form.insertAdjacentHTML("beforeend", tokenObj); 
        form.submit(); 
      }
    });
  });
};

window.addEventListener("turbo:load", pay);
