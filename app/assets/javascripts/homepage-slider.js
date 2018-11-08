document.addEventListener('DOMContentLoaded', function() {
  const nextButton = document.querySelector('.button-next');
  const prevButton = document.querySelector('.button-prev');

  nextButton.addEventListener('click', function() {
    const current = document.querySelector('.slide.active');
    const next = current.nextElementSibling;
    if (next) {
      current.classList.remove('active');
      next.classList.add('active');
    }
  });

  prevButton.addEventListener('click', function() {
    const current = document.querySelector('.slide.active');
    const prev = current.previousElementSibling;
    if (prev) {
      current.classList.remove('active');
      prev.classList.add('active');
    }
  });
});
