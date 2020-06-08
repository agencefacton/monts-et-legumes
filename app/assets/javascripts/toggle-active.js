document.addEventListener('DOMContentLoaded', function() {
  attachEvents();
});

document.addEventListener('attachEvents', function() {
  attachEvents();
});

function attachEvents() {
  var quantities = document.querySelectorAll('.product-order-quantity');

  quantities.forEach(function(quantity) {
    quantity.addEventListener("change", function() {
      quantity.parentNode.parentNode.classList.add('dirty');
    });
  });
}
