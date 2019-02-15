// document.addEventListener('DOMContentLoaded', function() {
//   const nextButton = document.querySelector('.button-next');
//   const prevButton = document.querySelector('.button-prev');

//   nextButton.addEventListener('click', function() {
//     const current = document.querySelector('.slide.active');
//     const next = current.nextElementSibling;
//     if (next) {
//       current.classList.remove('active');
//       next.classList.add('active');
//     }
//   });

//   prevButton.addEventListener('click', function() {
//     const current = document.querySelector('.slide.active');
//     const prev = current.previousElementSibling;
//     if (prev) {
//       current.classList.remove('active');
//       prev.classList.add('active');
//     }
//   });
// });

document.addEventListener('DOMContentLoaded', function() {
  var button1 = document.querySelector('.button1');
  var button2 = document.querySelector('.button2');
  var button3 = document.querySelector('.button3');
  var button4 = document.querySelector('.button4');

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
});
