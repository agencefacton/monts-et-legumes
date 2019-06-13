document.addEventListener('DOMContentLoaded', function() {
  var searchInput = document.querySelector('#search');
  searchInput.addEventListener('keyup', function() {
    var value = searchInput.value.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, "");
    document.querySelectorAll('.product-line').forEach(function(productLine) {
      var productName = productLine.dataset.productName.normalize('NFD').replace(/[\u0300-\u036f]/g, "");
      if (productName.includes(value)) {
        productLine.classList.remove('hide');
      } else {
        productLine.classList.add('hide');
      }
    });
  });
});
