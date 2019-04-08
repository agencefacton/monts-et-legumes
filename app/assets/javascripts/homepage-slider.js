document.addEventListener('DOMContentLoaded', function() {
  var button1 = document.querySelector('.button1');
  var button2 = document.querySelector('.button2');
  var button3 = document.querySelector('.button3');
  var button4 = document.querySelector('.button4');
  var button5 = document.querySelector('.button5');

  if (button1) {
    button1.addEventListener('click', function() {
      var current = document.querySelector('.active');
      var btnactive = document.querySelector('.btnactive')
      var slide = document.querySelector('.slide1');
      if (slide) {
        current.classList.remove('active');
        btnactive.classList.remove('btnactive')
        button1.classList.add('btnactive')
        slide.classList.add('active');
      }
    });
  }

  if (button2) {
    button2.addEventListener('click', function() {
      var current = document.querySelector('.active');
      var slide = document.querySelector('.slide2');
      var btnactive = document.querySelector('.btnactive')
      if (slide) {
        current.classList.remove('active');
        btnactive.classList.remove('btnactive')
        button2.classList.add('btnactive')
        slide.classList.add('active');
      }
    });
  }

  if (button3) {
    button3.addEventListener('click', function() {
      var current = document.querySelector('.active');
      var slide = document.querySelector('.slide3');
      var btnactive = document.querySelector('.btnactive')
      if (slide) {
        current.classList.remove('active');
        btnactive.classList.remove('btnactive')
        button3.classList.add('btnactive')
        slide.classList.add('active');
      }
    });
  }

  if (button4) {
    button4.addEventListener('click', function() {
      var current = document.querySelector('.active');
      var slide = document.querySelector('.slide4');
      var btnactive = document.querySelector('.btnactive')
      if (slide) {
        current.classList.remove('active');
        btnactive.classList.remove('btnactive')
        button4.classList.add('btnactive')
        slide.classList.add('active');
      }
    });
  }

  if (button5) {
    button5.addEventListener('click', function() {
      var current = document.querySelector('.active');
      var slide = document.querySelector('.slide5');
      var btnactive = document.querySelector('.btnactive')
      if (slide) {
        current.classList.remove('active');
        btnactive.classList.remove('btnactive')
        button5.classList.add('btnactive')
        slide.classList.add('active');
      }
    });
  }
});
