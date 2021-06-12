function tax (){
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("keyup", () => {
      const fee = priceInput.value * 0.1;
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = `${fee}`;
      const inputValue = priceInput.value - fee ;
      const profit = document.getElementById("profit");
      profit.innerHTML = `${inputValue}`;
      
    })
  }
  window.addEventListener("load", tax);