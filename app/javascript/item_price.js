window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value/10)
    const profit = document.getElementById("profit");
    const value_result = priceInput.value/10
    profit.innerHTML = (Math.floor( priceInput.value-value_result));
})
})