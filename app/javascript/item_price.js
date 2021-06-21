window.addEventListener("load",()=>{
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price")
    const value_price = Math.floor(inputValue * 0.1)
    addTaxDom.innerHTML = value_price;

    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = Math.floor(inputValue - value_price);
     
  })
})